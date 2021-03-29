Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8B34D75F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:36:05 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQwk8-0006PT-Mf
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQwhz-0005AH-CX
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQwhu-0008Pz-Qw
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617042824;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eHNuWgnwu6rNHDlxCpE/Kwv8RD1eesgZda3UZjFfyxM=;
 b=DSPwlBDxa2WTo4KLzxxXyiut+KHksojBLEBQxlfkXHKEm4sMQ+oZMexErr3iQWLXLwHAmM
 ug6aWvKr8O8sx1c6u3lAHVfbKnE6RwlX9eeSSn6kZSAQTjr7599EICjI8i2mSGVo/SLRDh
 P2TKHQ0PN8WIB9r3x0VIQ7R6GFziFg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-HxV-LJlENNiyPouVfUHUpA-1; Mon, 29 Mar 2021 14:33:36 -0400
X-MC-Unique: HxV-LJlENNiyPouVfUHUpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04962501FE;
 Mon, 29 Mar 2021 18:33:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7713A19D7C;
 Mon, 29 Mar 2021 18:33:29 +0000 (UTC)
Date: Mon, 29 Mar 2021 19:33:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YGIdduioIxRIxMMp@redhat.com>
References: <20210329180140.2761383-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210329180140.2761383-1-thuth@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 08:01:40PM +0200, Thomas Huth wrote:
> In an ideal world, we would all get along together very well, always be
> polite and never end up in huge conflicts. And even if there are conflicts,
> we would always handle each other fair and respectfully. Unfortunately,
> this is not an ideal world and sometimes people forget how to interact with
> each other in a professional and respectful way. Fortunately, this rarely
> happens in the QEMU community, but still there are such rare cases, and
> then it would be good to have a basic code of conduct document available
> that can be shown to persons who are misbehaving. And if that does not help
> yet, we should also have a conflict resolution policy ready that can be
> applied in the worst case.
> 
> The Code of Conduct document is based on the Django Code of Conduct
> (https://www.djangoproject.com/conduct/) and the conflict resolution
> has been assembled by Paolo, based on the Drupal Conflict Resolution Policy
> (https://www.drupal.org/conflict-resolution) and the Mozilla Consequence Ladder
> (https://github.com/mozilla/diversity/blob/master/code-of-conduct-enforcement/consequence-ladder.md)
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Discussion about a Code of Conduct already started off-list last summer,
>  but it unfortunately ceased without a result. Let's have another try
>  now by discussing this suggestion publically. I've picked the Django Code
>  of Conduct as a base, since it sounds rather friendly and still welcoming
>  to me, but I'm open for other suggestions, too.

The obvious alternative is to import the contributor covenant

  https://www.contributor-covenant.org/

IMHO the biggest appealing reason is that it is a defacto
common standard across a huge number of open source projects.

The second, it isn't a static document. It is being evolved over
time with new versions issued as understanding of problematic
situations evolves. We can choose to periodically update to stay
current with the broadly accepted norms.

I tend to view this similarly to license choice. It is almost
always better to adopt a commonly accepted standard as-i,s than
to have something custom to just one project, even if it was
derived from / inspired by another well known example project's
own example.

Overall I think it is a good idea to introduce an explicit CoC
doc to QEMU, and indeed any community project, so thanks for
bringing this up again.

> 
>  docs/devel/code-of-conduct.rst     | 85 ++++++++++++++++++++++++++++++
>  docs/devel/conflict-resolution.rst | 85 ++++++++++++++++++++++++++++++
>  docs/devel/index.rst               |  2 +
>  3 files changed, 172 insertions(+)
>  create mode 100644 docs/devel/code-of-conduct.rst
>  create mode 100644 docs/devel/conflict-resolution.rst
> 


> diff --git a/docs/devel/conflict-resolution.rst b/docs/devel/conflict-resolution.rst
> new file mode 100644
> index 0000000000..4eb4fb45df
> --- /dev/null
> +++ b/docs/devel/conflict-resolution.rst
> @@ -0,0 +1,85 @@
> +.. _conflict-resolution:
> +
> +Conflict Resolution Policy
> +==========================
> +
> +Conflicts in the community can take many forms, from someone having a
> +bad day and using harsh and hurtful language on the mailing list to more
> +serious code of conduct violations (including sexist/racist statements
> +or threats of violence), and everything in between.
> +
> +For the vast majority of issues, we aim to empower individuals to first
> +resolve conflicts themselves, asking for help when needed, and only
> +after that fails to escalate further. This approach gives people more
> +control over the outcome of their dispute.
> +
> +How we resolve conflicts
> +------------------------
> +
> +If you are experiencing conflict, you should first address the perceived
> +conflict directly with other involved parties, preferably through a
> +real-time medium such as IRC. If this fails, get a third-party (e.g. a
> +mutual friend, and/or someone with background on the issue, but not
> +involved in the conflict) to intercede or mediate.
> +
> +If you are witnessing conflict, you should also first try to address it
> +directly by interceding or mediating between the involved parties.
> +
> +If a good faith effort towards resolving the conflict fails,
> +escalate to the QEMU leadership committee by sending email at
> +qemu@sfconservancy.org. It is strongly suggested to include evidence of
> +past effort towards resolving the conflict.
> +
> +The QEMU leadership committee will do its best to review the incident
> +timely, and will either seek further information, or will make a
> +determination on next steps.
> +
> +Note: If the behaviour is threatening/harassing and requires immediate
> +escalation, contact the QEMU leadership committee immediately before
> +trying other steps, and possibly inform one or more members through IRC.
> +The up-to-date list of members is `available on the QEMU wiki
> +<https://wiki.qemu.org/Conservancy>`__.

I feel this section is rather disjoint. First repeatedly saying the
victim must try to resolve it themselves, and must provide prove of
trying to resolve it when escalating. Then at the end saying you can
ignore this and escalate immediately but only in certain nominated
circumstances. I get what this is trying to achieve, but I feel it
is overly complicated and first part comes across as putting the
burden on the person suffering to take the lead in resolving problems.

I feel the contributor covenant is clearer in this area through its
simplicity

Also this document doesn't mention anything about ensuring the
confidentiality/privacy for any complaints reported, which I
think is important to state explicitly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


