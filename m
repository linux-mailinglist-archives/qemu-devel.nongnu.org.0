Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3518F519E1D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:34:24 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDGw-0001ib-Vf
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmCRS-0006Hv-Hq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmCRP-0001J3-Ds
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651660866;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ftsd8Y8+0LUKRUmsexVcctz7PV5eTh5V45TTzNKtWps=;
 b=Iw/+YrBy1qIeCqA7bQfDGwnqi6ULLvTMFW/0MgHQn6veFYTkIzvwbJK1BGTbtE9Z4lkAWP
 rt9vONL74iSZtARsG1DVl5+WdP3O01W6qutXeHtpDhXPVsGqeUESdm4sWNZeNkn7yxu87p
 DuR7BgDUgjdeI2fVcXxzl00R3lyShXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-L7ggzszHO9CIP50CRlPVdg-1; Wed, 04 May 2022 06:41:05 -0400
X-MC-Unique: L7ggzszHO9CIP50CRlPVdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A98403C977C2;
 Wed,  4 May 2022 10:41:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C87E155B05D;
 Wed,  4 May 2022 10:41:03 +0000 (UTC)
Date: Wed, 4 May 2022 11:40:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, stefanha@redhat.com
Subject: Re: [qemu-web PATCH] Add public key for tarball-signing to download
 page
Message-ID: <YnJYO4YcfoMpApNu@redhat.com>
References: <20220504002129.286001-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220504002129.286001-1-michael.roth@amd.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 07:21:29PM -0500, Michael Roth wrote:
> We used to have public keys listed on the SecurityProcess page back
> when it was still part of the wiki, but they are no longer available
> there and some users have asked where to obtain them so they can verify
> the tarball signatures.
> 
> That was probably not a great place for them anyway, so address this by
> adding the public signing key directly to the download page.
> 
> Since a compromised tarball has a high likelyhood of coinciding with a
> compromised host (in general at least), also include some information
> so they can verify the correct signing key via stable tree git tags if
> desired.
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  _download/source.html | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/_download/source.html b/_download/source.html
> index 8671f4e..c0a55ac 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -23,6 +23,7 @@ make
>  </pre>
>  	{% endfor %}
>  
> +	<p>Source tarballs on this site are generated and signed by the package maintainer using the public key <a href="https://keys.openpgp.org/vks/v1/by-fingerprint/CEACC9E15534EBABB82D3FA03353C9CEF108B584">F108B584</a>. This key is also used to tag the QEMU stable releases in the official QEMU gitlab mirror, and so can be verified through git as well if there are concerns about the authenticity of this information.</p>

Line wrap your text at 80 cols please.

Also when downloading the key from that link, it does not contain any
user IDs, which does not fill me with confidence as someone wanting
to verify QEMU releases. Is there a link we can use which has the
user IDs in the key ?

I don't think we need to put the caveat about authenticity in the
last sentance, as that's just needlessly sowing seeds of doubt
IMHO. Lets keep is simple & clearly identify the key owner, so people can
match what they download against what we display, thus:


  <p>Git tags and source tarballs for official QEMU releases are signed by
     the release manager using
     <a href="https://keys.openpgp.org/vks/v1/by-fingerprint/CEACC9E15534EBABB82D3FA03353C9CEF108B584">this GPG Public Key</a>:
  </p>

  <pre>
pub   rsa2048/0x3353C9CEF108B584 2013-10-18 [SC]
      Key fingerprint = CEAC C9E1 5534 EBAB B82D  3FA0 3353 C9CE F108 B584
uid                    Michael Roth <flukshun@gmail.com>
uid                    Michael Roth <mdroth@utexas.edu>
uid                    Michael Roth <mdroth@linux.vnet.ibm.com>
sub   rsa2048/0x3B0B7D75D7AC684E 2013-10-18 [E]
  </pre>


Might be good to republish your key with updated UID for your AMD email
addr too, so there's an unambiguous connection between the email addr
you use you announce releases on the mailing list and the key used to
sign.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


