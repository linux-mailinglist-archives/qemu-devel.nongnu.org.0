Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7646084FE
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:15:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om7Cn-00031s-CR; Sat, 22 Oct 2022 01:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1om7Cj-000310-Na
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:37:53 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1om7Ch-0003i6-Ha
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:37:53 -0400
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 230707925
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jFJfaK3+6zIZUbpz8vbD5WFzkn2cJEfYwER7XKvMYLTBsI5bpzcCx
 mNMDWDVPfaKYjfwc9EgOt/ipE4AucfVxt9mSwo/qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg74s9JIGjhMsfja8Ek15K2aVA4w5TTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhRiroz6ZGBiuVIPM0SWuSWukwRpukoN2FvwXm8M49mBt4gZJ
 NygLvVcQy9wVkHHsL11vxW1j0iSlECJkVPKCSHXjCCd86HJW1Ltm8lsL31tBpQR98p5IT9H7
 fYULAlYO3hvh8ruqF66Yuxlh8BmNcqyeY1F4ikmwjbeAvIrB5vERs0m5/cChGZ21p0IR6yEI
 ZBBMVKDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//FvvDCMnVYsuFTrGProINfQGMoMon/bp
 nPv8jvUDg8/b8PKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUXo28g9/BqskOsSdb5Uluzp3vsUgMgZue82tYSsGmlopc4KS7AboTYZlatsOAbifI=
IronPort-HdrOrdr: A9a23:FA732axC6VgtXtfQdFZLKrPw+r1zdoMgy1knxilNoNJuA6ulfu
 SV7YkmPH7P+UwssRQb8+xoV5PwI080maQFhLX5eI3SIDUO21HYV72Kj7GSugEIcheWnoUttp
 uIMZIOcOEYZWIbsS+Q2njfLz9P+qjizImYwc3z9TNCdz1LVo1XxztFK2+gYzJLrcp9aabR1q
 Dw2iOKnVSdkL0sAaWGOkU=
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2022 01:37:46 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso5119919qkp.21
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 22:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5vBMd0LOAox4QpMIfnwN7h8G6Fzcv+hL58uFT7RekBU=;
 b=P/jKH5EjZS4G+fFppGgAkQ2CfkDU/Unx6bxHJ04M8F6P/iiKuJQXwtvqT3kf1PXthz
 R79GXmFKfjrxAKxUUDiCY128vPVh9fv5k/eI1MCkBns+pFybcExpHqKCISsIbDD0/Zgy
 1ntoJhcvFDjXFmyE5w/2YsIYVk9Qnyui7II/6z40hsBgd7Q3czlTbUxX9Cj7Kskf4UGJ
 g838M9fxgnfCWc7DRcjI5WOlwsmkUghWBZseSVJNutRulAahGviRbS9Hspy+mj5z+29q
 LZ7M3hI0xsjMVq47mUeA4EVZLu8GeLV0gapICNLV1lFqOIFbG5kIBwhB5lygY0vENLNW
 bM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vBMd0LOAox4QpMIfnwN7h8G6Fzcv+hL58uFT7RekBU=;
 b=VnElWNidBd+TuC2zlG62cGafuJ3w7XOJWAvyoBFaErnAaAQbM3d03P+XIPCNlLuwm3
 xT/pmybbFA1acEwj3hbT95gnh15J35o2nGzEU2CbtEjVHgJdHcqZKjVW0POIQ7+dHgzd
 Z6td5AetBNbv3p7z/VChdX40WHoN+CjZaFZS3kHgKfAOemGJqd6AVrM/yc3n5AN8q8fI
 PzZB1uD9phPXvuRoes1Cpt1Hvo0aIV3lVvK+gaVxhznmef5Y7zro6Cy8nNxkSDcMzlk2
 2n+rDJa5XwIJRD4GaJnk/w3Yedgq6VTOInUDs11tFImK9KvCORWYZuF2rSrbSMvnEOfA
 iUEQ==
X-Gm-Message-State: ACrzQf3jXQL9eBIqr08onr8EMuRTaqCBBvScmAmsIqPVsHrcvf4xahyk
 9ImathWnwobgLg4xGqqdF7GZNZwD5wXav4+E9H44M7dJcu1UPYgaN8NfwvLpeNn6jziF7FFVT4p
 SOQDn+PR49JdEoPI0/jCWhiuLbXiimw==
X-Received: by 2002:a05:6214:19cc:b0:4b7:768:aca1 with SMTP id
 j12-20020a05621419cc00b004b70768aca1mr13375928qvc.40.1666417066522; 
 Fri, 21 Oct 2022 22:37:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oSRl+MdW97ca6qhe11EsL2rHnWVAtr4WfWcfgn34wOe5oOSU8NWZeHHDn+1lbPuRTlxxtKQ==
X-Received: by 2002:a05:6214:19cc:b0:4b7:768:aca1 with SMTP id
 j12-20020a05621419cc00b004b70768aca1mr13375918qvc.40.1666417066288; 
 Fri, 21 Oct 2022 22:37:46 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 oo12-20020a05620a530c00b006eeae49537bsm10736615qkn.98.2022.10.21.22.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 22:37:46 -0700 (PDT)
Date: Sat, 22 Oct 2022 01:37:27 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <20221022053727.flc3bq3opyjimwgb@mozz.bu.edu>
References: <20221019191522.1004804-1-lk@c--e.de>
 <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.781, HK_RANDOM_FROM=1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 221021 1505, Alexander Bulekov wrote:
> On 221019 2115, Christian A. Ehrhardt wrote:
> > Fix memset argument order: The second argument is
> > the value, the length goes last.
> > 
> > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: qemu-stable@nongnu.org
> > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > ---
> >  hw/acpi/erst.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > index df856b2669..26391f93ca 100644
> > --- a/hw/acpi/erst.c
> > +++ b/hw/acpi/erst.c
> > @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> >      if (nvram) {
> >          /* Write the record into the slot */
> >          memcpy(nvram, exchange, record_length);
> > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> 
> Hi, 
> I'm running the fuzzer over this code. So far, it hasn't complained
> about this particular memset call, but it has crashed on the memcpy,
> directly preceding it. I think the record_length checks might be
> insufficient. I made an issue/reproducer:
> https://gitlab.com/qemu-project/qemu/-/issues/1268
> 
> In that particular case, record_length is ffffff00 and passes the
> checks. I'll keep an eye on the fuzzer to see if it will be able to
> crash the memset.

Here's a testcase for the memset issue:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -object memory-backend-ram,id=erstnvram,size=0x10000 -device \
acpi-erst,memdev=erstnvram -nodefaults -qtest stdio
outl 0xcf8 0x80001010
outl 0xcfc 0xe0000000
outl 0xcf8 0x80001014
outl 0xcfc 0xe0002000
outl 0xcf8 0x80001004
outw 0xcfc 0x02
write 0xe0000008 0x1 0x9c
write 0xe0002015 0x1 0x01
write 0xe0002066 0x1 0x02
write 0xe0000000 0x1 0x05
write 0xe0002066 0x1 0x04
write 0xe0000000 0x1 0x05
write 0xe0002066 0x1 0x01
write 0xe0000000 0x1 0x05
write 0xe0002065 0x1 0x01
write 0xe0000000 0x1 0x05
write 0xe0002066 0x1 0x02
write 0xe0000000 0x1 0x05
write 0xe0002066 0x1 0x03
write 0xe0000000 0x1 0x05
write 0xe0002015 0x1 0x20
write 0xe0002066 0x1 0x00
write 0xe0000000 0x1 0x05
EOF

> 
> For this patch:
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> >          /* If a new record, increment the record_count */
> >          if (!record_found) {
> >              uint32_t record_count;
> > -- 
> > 2.34.1
> > 
> > 

