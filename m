Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FE4B9C70
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:49:10 +0100 (CET)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdPR-0002ck-Nd
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKdKZ-0007wt-D5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:44:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKdKU-0005PR-9K
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645091036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5b77v3HeGVaaaAxPqEEKyh1KJD416NcpLjLcARsu3Ok=;
 b=jDOqPSY1QmLU6NRn+XwKm5VnVGuiIRbzRJVgQkxqkRpYtOG7qBYNYCOEj212w7OCir7kqT
 eP04TNQiM6FWtjtigvGpHsu/z6EYvb3x4ZnVIWR0nMBOjczanfGl4cf+9rrqpz6IHyWrxC
 R1wlVMyVfgMqGXHwbPMzjJrF4kSgmbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-08o-HhtkPU6NzJrBd5oeKw-1; Thu, 17 Feb 2022 04:43:54 -0500
X-MC-Unique: 08o-HhtkPU6NzJrBd5oeKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so2048998wrg.19
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 01:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5b77v3HeGVaaaAxPqEEKyh1KJD416NcpLjLcARsu3Ok=;
 b=hOgcli5KVjcsVBzX7SGQT456ssIp33pifXAvssPawljmnEZ0d2XGGoMPTKhDSz2cX2
 DNIUZyhML/o42B551hNAniw3KVUZLoYB7/KU3R3j93hRQRNRLnb+dnmJyvPiiPens94z
 QBzeZKI3ixMDYd5IbpAu5sxk/OhHVEX6wEG4JIYFx1vRjgf0BQIwamqMbxKlo3VIMyXn
 4EkWdFwtmIGFWQUH7pzV+6xOcsAa52HYxQoDPp3P+aZkl1j1SWupVzyfXY63YKnZUJZU
 n5u1ta5RyoWYeAaIFpUMdONkBGD1i1OmRyvpja4tL8gSg/oBgjM93wrR4UL0sHTTGY1g
 8niA==
X-Gm-Message-State: AOAM533OjfIp7lHAdeLtNMs+MgpILmW0SfwNIhyVZmKO3Fw2hfPnNPpw
 dbgG3LKkuGix2Y3tFAJPwcFTBOyinsop2rTKDFUYhlmiG0GTjT7Qka9s2q6f8FmsgQ5ToP+FVCF
 sxGqGsWF+bJjm+DE=
X-Received: by 2002:a5d:6e09:0:b0:1e4:a65a:c3ca with SMTP id
 h9-20020a5d6e09000000b001e4a65ac3camr1565551wrz.235.1645091033665; 
 Thu, 17 Feb 2022 01:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdQ3Ilff31KkgO6yDzU9/ah8dGZwVmKSEpD3tlkkm7PaA4GfeCHjGFYEIi0h/kbeIKtHbM3Q==
X-Received: by 2002:a5d:6e09:0:b0:1e4:a65a:c3ca with SMTP id
 h9-20020a5d6e09000000b001e4a65ac3camr1565538wrz.235.1645091033408; 
 Thu, 17 Feb 2022 01:43:53 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id j15sm864538wmq.6.2022.02.17.01.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 01:43:52 -0800 (PST)
Date: Thu, 17 Feb 2022 09:43:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg4Y1i17My7X3bTq@work-vm>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm> <Yg042JzxCjgF2siM@redhat.com>
 <Yg067jLmVM4aIFIq@work-vm> <Yg4VaTuXWME0LQUP@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yg4VaTuXWME0LQUP@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, Thomas Huth <thuth@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Feb 16, 2022 at 05:57:02PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Thomas Huth (thuth@redhat.com) wrote:
> > > > > On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > > > > > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > > > > >    Hi,
> > > > > > > > Given the semantic differences from 'i440fx', changing the default
> > > > > > > > machine type has effects that are equivalent to breaking command
> > > > > > > > line syntax compatibility, which is something we've always tried
> > > > > > > > to avoid.
> > > > > > > 
> > > > > > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > > > > > a default, effectively making -M $something mandatory, similar to arm.
> > > > > > 
> > > > > > Oh, that's probably easy to do;  what are other peoples thoughts on
> > > > > > that?
> > > > > 
> > > > > I agree with Gerd. Getting rid of a default machine on x86 is likely better
> > > > > than silently changing it to q35. But I'd maybe say that this should go
> > > > > through the deprecation process first?
> > > > 
> > > > So just adding something like the following under 'System emulator
> > > > machines':
> > > > 
> > > > x86 default machine type
> > > > ------------------------
> > > > 
> > > > x86 currently defaults to the very old ```pc``` machine type
> > > > which is based on the very old ```i440f``` chipset.  This default
> > > > will be removed and the user will be required to specify a machine
> > > > type explicitly using -M; users are encouraged to switch to the
> > > > not quite as old ```q35``` machine types.
> > > > 
> > > > 
> > > > (This option is going to take a lot more work switching all the
> > > > test cases over; in my world here I'd only changed the tests that broke
> > > > on q35, now everything is going to need to specify a type).
> > > 
> > > ....which is still nothing compared to how many users will be impacted
> > > and the docs all over the internet we'll never be able to change, which
> > > give illustrations using qemu command lines without '-M pc'
> > 
> > What's your prreference - it sounds like you'd prefer to leave the
> > default as 'pc' ?
> 
> Yes.

Damn, that means we've got a 3 way split of people preferring pc, q35
and no default.

> > aarch's message is:
> > qemu-system-aarch64: No machine specified, and there is no default
> > Use -machine help to list supported machines
> > 
> > We could add a:
> > 'Use -machine pc for the old default behaviour'
> 
> Does this really serve to benefit our users though ? As noted, this
> will have no benefit to any mgmt app using libvirt, as it'll still
> explicitly set 'pc' by default. So we only impact basic users who
> are relying on QEMU's built-in defaults.

Right; since none of this impacts libvirt users it's all about the
(substantial number of) users who run qemu manually.
Any change will surprise them, if the change (no default) is going to
produce an error, then it may as well be a helpful error telling them
how to fix it.

> It feels like the arguments for removing the machine type default
> apply equally to other aspects of QEMU defaults. ie lets make
> -cpu, -accel, -m, -smp, and -display mandatory too, since the
> defaults might not be right for some users ?

My preference here was changing the default to q35 rather than
requiring an explicit selection; however I don't think requiring -M is
unreasonable, since it's an easy enough selection.

Requiring '-m' might also be a reasonable requirement - there's very few
use cases on x86 where the default works (probably just running DOS).

Dave


> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


