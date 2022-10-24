Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F12960AD71
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:24:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxOB-00017c-N0; Mon, 24 Oct 2022 09:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1omxO9-00017T-5v
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:21:09 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1omxO7-000318-A7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:21:08 -0400
X-IronPort-RemoteIP: 209.85.166.197
X-IronPort-MID: 233026298
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y5r8r6j5WKsKQr2hHRDKxVnmX1610hIKZh0ujC45NGQN5FlHY01je
 htvD2iOa66Ma2r0etl/OYi08kJXvpeHyIc3SQpkr3hkQXsW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4m9A5DTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGVQYYP6gapP1MPD9x2
 fAZI243SxuGvrfjqF67YrEEasULKcDqOMYeviglw2iIUrApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2QpNUWfC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJl1cpiua3YYq9ltqiZMlLmWGRp
 EX9zn3mAVZZJdmylmqUyyf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rrKxrsULyH4a7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmMphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:60k6y6ijdmJn2pWwUULZ/01wSHBQXrUji2hC6mlwRA09TySZ//
 rAoB3B73HJYVkqM03I9errBEDiexLhHPdOiOEs1NyZMTUO1lHFEL1f
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 09:21:02 -0400
Received: by mail-il1-f197.google.com with SMTP id
 u2-20020a056e021a4200b002f9ecfa353cso8823687ilv.20
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nvnvkWsvYVMJH50mh3BRD55Ecp44Gu2npUlh89Y4+yo=;
 b=NX6NONoxefjbeafhTH3KXbyU6ISr4bZvhLfHGOaQ6jM4nNh1LLTTiT/3mkRJjgtppa
 ROt3Tzay6v7pobAM44W4CLlOzRurBOsclM5/q+ad4wG5TrPfMe3AxUOeUqcuEiXqTXM+
 h4WfVE3mklz7PbTD8hzhx9Aew0tPT+DN55zE/MRYMleyPiQ6B2tjElaRVA8CWbxwQpYt
 bSnhJcnjT7HpWKRj8I0arVXOSdBtD/Pq3vgfG8s7Ifbxyr37kzLX/QDvGL1AWbO3estO
 vIdbSmoMYOmtDRCLA3AM91bXGPANb6sbuOE0FZ86JFn2Rfq7rmLsOPowkL0cSVGIJmEf
 FP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvnvkWsvYVMJH50mh3BRD55Ecp44Gu2npUlh89Y4+yo=;
 b=TTt2TNVWscLWUcXKuYa2f0Lcu0Koiw2CNUl/Pxf6SozvfPQAOJ9EfGrLuQNWEGXxje
 MfrP8ffpamVusU+PGwquS14mnZfTPC0yckelsepwlsMZ+jvObTvwvb6BQeBYRu+I7i58
 DcYMkFVsNwfBxaLpLUcQPbU3IguFePCxQ6xtxdb5Hp/SbFLyzf34RvvuNx0qRvWN13WU
 noF8Uyh9Vz7Nhvc31rBBnx/elCDKP4P3Jd4gtSY9PXkUVdwBaVfBxzQhdJCOk6ED7imO
 /Xg3jK/ErSOsy7cPU/J8UFphgaOBs2akxfaTTiwblbwUaRICOa6ckROEU7r1pdW79fgr
 Uk3g==
X-Gm-Message-State: ACrzQf3n6nWIvKvdYa9Z/zdmfC3cXqYRnjdjV+eO5W3ym8bVWe7a0LHT
 L03sXG0BUjaxwzu5HxuJc+94rks46VAv7PZuxLGCUHevGrif4dmNEQrmR1LMdx4ayUB48WuWvua
 3Mp7Nwt2QawJnycdInPm+C3gl/PUSiA==
X-Received: by 2002:a05:6638:4810:b0:374:f69f:fd51 with SMTP id
 cp16-20020a056638481000b00374f69ffd51mr1441588jab.152.1666617662251; 
 Mon, 24 Oct 2022 06:21:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mple4oXRMeLdO7LWE99Dv29tIrwVK6izhvolhMhyMS3XrFuMFIV/fNDx68tneWp5fYgRbbQ==
X-Received: by 2002:a05:6638:4810:b0:374:f69f:fd51 with SMTP id
 cp16-20020a056638481000b00374f69ffd51mr1441571jab.152.1666617661960; 
 Mon, 24 Oct 2022 06:21:01 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 c37-20020a029628000000b00365ddf7d1d8sm4741258jai.53.2022.10.24.06.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:21:01 -0700 (PDT)
Date: Mon, 24 Oct 2022 09:20:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <20221024132040.5dnn45eatygojipe@mozz.bu.edu>
References: <20221019191522.1004804-1-lk@c--e.de>
 <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
 <20221022053727.flc3bq3opyjimwgb@mozz.bu.edu>
 <Y1VRj0Eu4iGp0smF@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1VRj0Eu4iGp0smF@cae.in-ulm.de>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 221023 1637, Christian A. Ehrhardt wrote:
> 
> Hi,
> 
> On Sat, Oct 22, 2022 at 01:37:27AM -0400, Alexander Bulekov wrote:
> > On 221021 1505, Alexander Bulekov wrote:
> > > On 221019 2115, Christian A. Ehrhardt wrote:
> > > > Fix memset argument order: The second argument is
> > > > the value, the length goes last.
> > > > 
> > > > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > > > Cc: qemu-stable@nongnu.org
> > > > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > > > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > > > ---
> > > >  hw/acpi/erst.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > > index df856b2669..26391f93ca 100644
> > > > --- a/hw/acpi/erst.c
> > > > +++ b/hw/acpi/erst.c
> > > > @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> > > >      if (nvram) {
> > > >          /* Write the record into the slot */
> > > >          memcpy(nvram, exchange, record_length);
> > > > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > > > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> > > 
> > > Hi, 
> > > I'm running the fuzzer over this code. So far, it hasn't complained
> > > about this particular memset call, but it has crashed on the memcpy,
> > > directly preceding it. I think the record_length checks might be
> > > insufficient. I made an issue/reproducer:
> > > https://gitlab.com/qemu-project/qemu/-/issues/1268
> > > 
> > > In that particular case, record_length is ffffff00 and passes the
> > > checks. I'll keep an eye on the fuzzer to see if it will be able to
> > > crash the memset.
> > 
> > Here's a testcase for the memset issue:
> 
> Looks like this check in {read,write}_erst_record():
> |   if ((s->record_offset + record_length) > exchange_length) {
> |       return STATUS_FAILED;
> |   }
> 
> has an integer overrun and should be re-written as:
> |   if (record_length > exchange_length - s->record_offset) {
> |       return STATUS_FAILED;
> |   }
> 
>        regards    Christian

Hi Christian,
With this change applied (along with the memset fix), the fuzzer doesn't
find any crashes.
Thanks
-Alex

