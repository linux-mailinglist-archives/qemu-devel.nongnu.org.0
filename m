Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950714CD6A3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:43:34 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ99Y-0002C6-R4
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:43:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ8cq-0000zC-VP
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:09:46 -0500
Received: from [2a00:1450:4864:20::630] (port=37823
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ8cp-0004rh-3q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:09:44 -0500
Received: by mail-ej1-x630.google.com with SMTP id bg10so17773019ejb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2f0mdabohj8Ojnc59Qxzm8nzXndbNPqHDhnsWKMeUes=;
 b=txuHuxp+SbUT3gFt9lbFOaWijlQw517/cdfOdk4TyjAnGXp1kIdmYEcfuiGsP9spK8
 OexJzNmk5BCrRypbR1B+9fWWTgFprS1ddOSjwviuEC6ua3uCcWP9B9NKX4F10ntYk4rY
 9QUhbHnGlYrVFWJm8xll+uaKaPz0TyClIHIctwqsjySOI32LcySs0GC90NiCRc+vnQRw
 BDZ8AHI5YTx61ezTU793tNMhErazh3oTaz7c9wS+Zl7QUvaDLlDwhJKu9kbRzgmzeOHu
 3b0AUy9GpsSmJlLeNMqe/ZE0cA0vaVqkm/13dewuFh1N2sjYnhN6B4wiil+gDCAxO3Oi
 snUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2f0mdabohj8Ojnc59Qxzm8nzXndbNPqHDhnsWKMeUes=;
 b=B1f0lT3xU/dKfQdD5rrvxfbAd5NCER/BUOd/zhJnhBhqZO1orNDZ9/cd9I2CQZLI0t
 uFKC84TiC4NweOuH9UhvUhoMWTqXPyxyykRSdFZFQ81/mOCb82L4s3pdXPQAoOKGVMNp
 N0j6MHaWbFcWkyPQY9KVR5WQMaA4AFwvQ3STEt5Ijl/nQm96MGKwc+ZfCsXmDVkDdK6r
 YEGpgMIEG74X1W7EM0FM782J1TWyjyIwP9yXW4CktUiWqSoxz2fybJLDyIK76wfnZ2iD
 qwZnomAJxERBnDdJtEzOvD7KPMEFEQ4fxbBSw9Cp9WI2xuc+WI2cjdVqHOU46EF+2LCt
 RFWg==
X-Gm-Message-State: AOAM531AI+ZZOXKfS75v45Df4o+VVepuqUFnBRpEmLYlH9jlfmcNUmkF
 X5/qFq82bJXGkHXTeguGvMofVzeuwCrMvo+xYBhMxQ==
X-Google-Smtp-Source: ABdhPJxrYfi1XHGtJYN+0ywQDroiuS7y3SBDzUHeERTeoOEeeNJ68Bm/JNcRxDWazFC30Ay4EmZqIMHuv9QP85VmZbA=
X-Received: by 2002:a17:906:c14c:b0:6d7:1278:d80c with SMTP id
 dp12-20020a170906c14c00b006d71278d80cmr13464729ejc.660.1646402981596; Fri, 04
 Mar 2022 06:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20220304115257.1816983-1-ani@anisinha.ca>
 <20220304115257.1816983-4-ani@anisinha.ca>
 <20220304081931-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220304081931-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Mar 2022 19:39:30 +0530
Message-ID: <CAARzgwxWvnUizU7b_5SSg41UR49cJ5Li3ZczoqMBaCJeMmxSCw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] tests/acpi: i386: update FACP table differences
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 6:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Mar 04, 2022 at 05:22:57PM +0530, Ani Sinha wrote:
> > From: Liav Albani <liavalb@gmail.com>
> >
> > After changing the IAPC boot flags register to indicate support of i804=
2
> > in the machine chipset to help the guest OS to determine its existence
> > "faster", we need to have the updated FACP ACPI binary images in tree.
> >
> > The ASL changes introduced are shown by the following diff:
> >
> > @@ -42,35 +42,35 @@
> >  [059h 0089   1]     PM1 Control Block Length : 02
> >  [05Ah 0090   1]     PM2 Control Block Length : 00
> >  [05Bh 0091   1]        PM Timer Block Length : 04
> >  [05Ch 0092   1]            GPE0 Block Length : 10
> >  [05Dh 0093   1]            GPE1 Block Length : 00
> >  [05Eh 0094   1]             GPE1 Base Offset : 00
> >  [05Fh 0095   1]                 _CST Support : 00
> >  [060h 0096   2]                   C2 Latency : 0FFF
> >  [062h 0098   2]                   C3 Latency : 0FFF
> >  [064h 0100   2]               CPU Cache Size : 0000
> >  [066h 0102   2]           Cache Flush Stride : 0000
> >  [068h 0104   1]            Duty Cycle Offset : 00
> >  [069h 0105   1]             Duty Cycle Width : 00
> >  [06Ah 0106   1]          RTC Day Alarm Index : 00
> >  [06Bh 0107   1]        RTC Month Alarm Index : 00
> >  [06Ch 0108   1]            RTC Century Index : 32
> > -[06Dh 0109   2]   Boot Flags (decoded below) : 0000
> > +[06Dh 0109   2]   Boot Flags (decoded below) : 0002
> >                 Legacy Devices Supported (V2) : 0
> > -            8042 Present on ports 60/64 (V2) : 0
> > +            8042 Present on ports 60/64 (V2) : 1
> >                          VGA Not Present (V4) : 0
> >                        MSI Not Supported (V4) : 0
> >                  PCIe ASPM Not Supported (V4) : 0
> >                     CMOS RTC Not Present (V5) : 0
> >  [06Fh 0111   1]                     Reserved : 00
> >  [070h 0112   4]        Flags (decoded below) : 000084A5
> >        WBINVD instruction is operational (V1) : 1
> >                WBINVD flushes all caches (V1) : 0
> >                      All CPUs support C1 (V1) : 1
> >                    C2 works on MP system (V1) : 0
> >              Control Method Power Button (V1) : 0
> >              Control Method Sleep Button (V1) : 1
> >          RTC wake not in fixed reg space (V1) : 0
> >              RTC can wake system from S4 (V1) : 1
> >                          32-bit PM Timer (V1) : 0
> >                        Docking Supported (V1) : 0
> >
> > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > Acked-by: Ani Sinha <ani@anisinha.ca>
>
> Fails make check:
> =E2=96=B6  3/60 ERROR:../tests/qtest/bios-tables-test.c:532:test_acpi_asl=
: assertion failed: (all_tables_match) ERROR

Unable to repro this even after rebasing to latest master.

