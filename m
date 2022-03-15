Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509074D98A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:24:16 +0100 (CET)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4Lf-0006vT-Cm
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:24:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU4Hs-0003f4-OX
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU4Ho-0003up-OI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647339615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XxMvkuC7USB+drxSX+n5zFqn1B+31AoJHzEuA0BmT7k=;
 b=cLoNirlKyOZ6rYNxml2F63Ot43xLcpGuvotGS2EXINkKWDa/SHyWcnmh2BkzjnIglvPhZI
 JMsZST6/y1rwMDALu3dZigxhdBAHx2sa+04dFZgNmDZ0PgRLmAgGEhU+9pNndNuaxjNC/j
 lbrNSp7uq/CJ/Lo0FvL9YfL2UzC2fn0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-Ov5DNooGMuGuwkonKYHGyA-1; Tue, 15 Mar 2022 06:20:06 -0400
X-MC-Unique: Ov5DNooGMuGuwkonKYHGyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7E603C1855C;
 Tue, 15 Mar 2022 10:20:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4802E2156A5A;
 Tue, 15 Mar 2022 10:19:58 +0000 (UTC)
Date: Tue, 15 Mar 2022 10:19:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as PNG.
Message-ID: <YjBoS6qvjE6EHokR@redhat.com>
References: <20220301064424.136234-1-kshitij.suri@nutanix.com>
 <20220301064424.136234-2-kshitij.suri@nutanix.com>
 <871qz88yu7.fsf@pond.sub.org>
 <30e38de3-3b07-b440-ad32-a189720db301@nutanix.com>
 <87r173o7h4.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r173o7h4.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: soham.ghosh@nutanix.com, prerna.saxena@nutanix.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 kraxel@redhat.com, thuth@redhat.com, prachatos.mitra@nutanix.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 11:06:31AM +0100, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
> 
> > On 11/03/22 5:50 pm, Markus Armbruster wrote:
> >> Kshitij Suri <kshitij.suri@nutanix.com> writes:
> >>
> >>> Currently screendump only supports PPM format, which is un-compressed and not
> >>> standard. Added a "format" parameter to qemu monitor screendump capabilites
> >>> to support PNG image capture using libpng. The param was added in QAPI schema
> >>> of screendump present in ui.json along with png_save() function which converts
> >>> pixman_image to PNG. HMP command equivalent was also modified to support the
> >>> feature.
> >>>
> >>> Example usage:
> >>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
> >>> "format":"png" } }
> >>>
> >>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=SxmcA4FlCCy9O9eUaDUiSY37bauF6iJbDRVL--VUyTG5Vze_GFjmJuxgwAVYRjad&s=OIKnm9xXYjeat7TyIJ_-z9EvG2XYXMULNbHe0Bjzyjo&e=
> >>>
> >>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> 
> [...]
> 
> >>> diff --git a/qapi/ui.json b/qapi/ui.json
> >>> index 9354f4c467..6aa0dd7c1b 100644
> >>> --- a/qapi/ui.json
> >>> +++ b/qapi/ui.json
> 
> [...]
> 
> >>>   ##
> >>>   # @screendump:
> >>>   #
> >>> -# Write a PPM of the VGA screen to a file.
> >>> +# Write a screenshot of the VGA screen to a file.
> >>
> >> Is "VGA screen" accurate?  Or does this work for other displays, too?
> >
> > The patch didn't modify any display changes and VGA screen was
> > previously supported display type.
> 
> Let me rephrase my question: was "VGA screen" accurate before your
> patch?

No, it would be better phrased as

  "Capture the specified screen contents and write it to a file"

In a multi-head scenario, it can be any of the output heads, and
whether the head is in a VGA mode or not is irrelevant to the
command functionality.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


