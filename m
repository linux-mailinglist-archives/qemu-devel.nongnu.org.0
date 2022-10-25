Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51860BF89
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:28:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on7kv-0000qb-Nw; Mon, 24 Oct 2022 20:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1on7kt-0000qF-N8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:25:19 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1on7kq-0002Pv-LE
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:25:19 -0400
X-IronPort-RemoteIP: 209.85.166.198
X-IronPort-MID: 234562202
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tVjZha8oCms2Z8/DczfmDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GdLDz+PMqqKYjH1c913aIXl808Cvp/czYBrG1NtqioxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimMc3l48sfrZ8ko35qiq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE3f5RE2MpZZ0j5qVmAWNL9
 tEYIjc8V0XW7w626OrTpuhEg80iKIzqONpatCgxnXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZRfMGs/BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtuDSOklYriOKF3Nz9V/XUROtUsH6iv
 WPXwkPJIRweDuSx1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR+y536KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjJYJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:TUJXZaOMfg/Q1cBcThijsMiBIKoaSvp037BL7TENdfUxSKelfq
 +V/cjzqiWE7gr5NEtNpTnCAtj4fZqkz+8P3WBJB8bZYOCEghrVEGgB1+vfKlTbckWVygc678
 hdmsNFZeEYY2IVsS6GiDPIa+rIFOP3kpxB+Y/lvhBQpHlRGsJdBvBCe2Km++RNNWx7OaY=
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 20:25:03 -0400
Received: by mail-il1-f198.google.com with SMTP id
 z19-20020a056e02089300b002fffe186ac4so3008148ils.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 17:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6g91ZMq55e1s4oaZe5Wt6J8s2RgSs1kLU1Egrbumo8I=;
 b=LbqAVzdECMFLg364j8Xbt23qdc0Z/0sK6LDDBmEFlVHor/YbLZ/DG3HzKptXnVnMnk
 ZvicneOlFhUR1fnBG4dIREW/LI8pqZPI9iKBNKC6Q/Dr4YN4auOJaofNufHCpJcLKBDt
 V2WpM3lkFSt9wAptICoJ3W53vxIp1Ch8i8iN1gkKg0wlITHK6iWKDE3gcRoe1ph4JDv+
 NBbFRHnwK8DI50jxYqUVeXLzMXqOcGoM7YDuSTP17pj2cGeUpzHtQ7HSrMX0zpcTJjCN
 +qAebBidtCC57rG1cEftiw5XmCrV7ep75QjvL0PM3RY+1YoosM0cN1kg7qlBlCcYSs9w
 NFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6g91ZMq55e1s4oaZe5Wt6J8s2RgSs1kLU1Egrbumo8I=;
 b=pVu6XVEYzcb2qUqxKhUOPN3ugPemYax5Ictrzn+9+XaqhDwj8ZZtNicJc+vTpH7aD+
 qfRpODWL7ZPmNIq8oj0oUPOVD2y1zv/LunRPc1mRieh2fjnMVG/NMJoUtyRBjcyYa1XG
 mCsPKTv92xPCCxBRGvpF1ww9jkcLe7NZSgbF0GMfR9tgy3xJZ6cFyPc5Z/Ci266aeyHE
 JT65VryWtVeCJKuqKa6wdew065rvKHEEfJgddx1TG8yXAsBwcS5QVzn/MY5DNE1GFI4E
 PhPjPmEhIIO6Oje/rJn3i5B87T53F0SXKOhVvQpmViQ1Apv92PzpGEYuwK7vysseeohx
 9RbA==
X-Gm-Message-State: ACrzQf3TywL36Z4hhlZUHgPJBIq6k3hJ7p/UcgjXizmhyGDLGwWDQVqh
 xZqpxJsI0OVu3nwpFCTcOS+T9B8mE9O+9WXkExdjCGGDoYlxqslr+kzrHmlVPLwxyXnbk+GnIvf
 Svj+0Y9/lLnzcaXD96GSkmB0pMledjQ==
X-Received: by 2002:a5e:d502:0:b0:689:72da:ab3f with SMTP id
 e2-20020a5ed502000000b0068972daab3fmr21288017iom.109.1666657503516; 
 Mon, 24 Oct 2022 17:25:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41GWSanl7lyecv8sIPo9ztwqGQ6rQlavcyWsKbgUICHeBsOrah1mXZy99jguTvC3sUdtf2Gw==
X-Received: by 2002:a5e:d502:0:b0:689:72da:ab3f with SMTP id
 e2-20020a5ed502000000b0068972daab3fmr21288003iom.109.1666657503217; 
 Mon, 24 Oct 2022 17:25:03 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a056e020f0700b002f90d038403sm481151ilj.63.2022.10.24.17.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 17:25:02 -0700 (PDT)
Date: Mon, 24 Oct 2022 20:24:42 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric DeVolder <eric.devolder@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221025002442.nym4emonrbzbnib6@mozz.bu.edu>
References: <20221024100323-mutt-send-email-mst@kernel.org>
 <20221024154233.1043347-1-lk@c--e.de>
 <20221024162453.4cwxxam6u3s5ia7v@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024162453.4cwxxam6u3s5ia7v@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 221024 1224, Alexander Bulekov wrote:
> On 221024 1742, Christian A. Ehrhardt wrote:
> > - Fix memset argument order: The second argument is
> >   the value, the length goes last.
> > - Fix an integer overflow reported by Alexander Bulekov.
> > 
> > Both issues allow the guest to overrun the host buffer
> > allocated for the ERST memory device.
> > 
> > Cc: Eric DeVolder <eric.devolder@oracle.com
> > Cc: Alexander Bulekov <alxndr@bu.edu>
> > Cc: qemu-stable@nongnu.org
> > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> 

Also:
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1268

> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > ---
> >  hw/acpi/erst.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > index df856b2669..aefcc03ad6 100644
> > --- a/hw/acpi/erst.c
> > +++ b/hw/acpi/erst.c
> > @@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
> >          if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
> >              rc = STATUS_FAILED;
> >          }
> > -        if ((s->record_offset + record_length) > exchange_length) {
> > +        if (record_length > exchange_length - s->record_offset) {
> >              rc = STATUS_FAILED;
> >          }
> >          /* If all is ok, copy the record to the exchange buffer */
> > @@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> >      if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
> >          return STATUS_FAILED;
> >      }
> > -    if ((s->record_offset + record_length) > exchange_length) {
> > +    if (record_length > exchange_length - s->record_offset) {
> >          return STATUS_FAILED;
> >      }
> >  
> > @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> >      if (nvram) {
> >          /* Write the record into the slot */
> >          memcpy(nvram, exchange, record_length);
> > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> >          /* If a new record, increment the record_count */
> >          if (!record_found) {
> >              uint32_t record_count;
> > -- 
> > 2.34.1
> > 
> > 

