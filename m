Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F1252667
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 07:06:06 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAndN-0001oE-AC
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 01:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAnce-0001Hm-Qe
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 01:05:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24188
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAncc-0007y6-0t
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 01:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598418316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iU69F1TtzUKygTBozYbgCXh2SE8FidbtXWBriLumDnY=;
 b=QRrxImU/dEDsjG68dn0D8UQvUbtVu8moJs0nYH3IKGqzc2TkjW21bkDZ1uGX7UtnaggYp9
 CKMWdN6BsMkbxe5ZvvjrPTWZbHZjWFVEicJ4MUxyoIKzqGrjy5/n8b4bxi96Azg6DzDGQC
 xBXLrhxGZkk6SRXhoaMYo1VG8YZ99+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-XlL7IFCaO-CJnvE3RB92Ng-1; Wed, 26 Aug 2020 01:05:12 -0400
X-MC-Unique: XlL7IFCaO-CJnvE3RB92Ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3578D189E606;
 Wed, 26 Aug 2020 05:05:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE1017A403;
 Wed, 26 Aug 2020 05:05:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D85F39C86; Wed, 26 Aug 2020 07:05:09 +0200 (CEST)
Date: Wed, 26 Aug 2020 07:05:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] meson: set colorout to auto
Message-ID: <20200826050509.5626ao35salut3ma@sirius.home.kraxel.org>
References: <20200825064342.2037-1-kraxel@redhat.com>
 <8cdf13b9-49c4-f12c-c67e-6e03e8e802b7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8cdf13b9-49c4-f12c-c67e-6e03e8e802b7@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 01:05:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 25, 2020 at 06:26:33AM -0700, Richard Henderson wrote:
> On 8/24/20 11:43 PM, Gerd Hoffmann wrote:
> > Dunno why the default is set to "always".  IMHO it should be "auto",
> > i.e. only colorize in case stdout goes to a terminal.  Cluttering
> > logfiles and confusing compiler message parsers with terminal control
> > sequences is not nice ...
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  meson.build | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Yes please.  All the color escape codes has broken emacs make next-error.
> 
> Although applying this doesn't seem to have helped...

meson remembers the state of the options, so running a build alone
doesn't help.  rm -rf $builddir and starting over will pick up the
new default.  You can probably also use "meson configure $something".

HTH,
  Gerd


