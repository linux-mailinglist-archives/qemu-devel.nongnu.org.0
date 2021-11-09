Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D688E44B18F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:51:28 +0100 (CET)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkULI-0008UB-0Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkUJw-0007gf-ED
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:50:04 -0500
Received: from [2a00:1450:4864:20::52e] (port=39854
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkUJr-0001cA-FF
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:50:04 -0500
Received: by mail-ed1-x52e.google.com with SMTP id r12so78980466edt.6
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0JMIt8KA4GWBUUzrt6xQerAwuwMWKCXWzN3SdD4H4fM=;
 b=SYRPCHKo/8qfZ6f5H3MNiet1/zMKB6W7jv7Ovz4nAPAK9FcnEUPVY54Hp1B3ZbSQh8
 kivX24Ous6rjn+s12GjVle8nx40H+M6cYNL+Kj1KqHOZYN8EGx8VdDqDFauPRtbZLGFd
 eHX2JbyzoWCco9xlclSd7HGjY2nFRx7MiRWuXvkT/9EyVwo0rZA15hTf/cihTtxWDyZP
 cNU/x0DAmo+gFa+zouslqQsFYnwS6Z0ZetbUBKyM19kuyfXk8l4Swhvf8ypusagvifK/
 fV7MqenGx8HmyNPRS2fH3EGuas7h056z5yIDldCYH2g4ukQBFM+gBiEeiFYOjC2cl8Xv
 MBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0JMIt8KA4GWBUUzrt6xQerAwuwMWKCXWzN3SdD4H4fM=;
 b=mvd5HKsdqTHllt8Zfd+Sarcdy658WKCxV0RLu7BEtZu5IwWdkzhYRn6VK/kZTy9Mtt
 bgliR+3tovnNLptKNvkVVbgKENokl2pV/Io/iQYYC08o904li/TNuhQFDulALrQyFxt1
 5CPMlgq6KkfHkGqXQiPwe8WS8Bg12V4AzS+RGpWE2iRwsZCVRLVIOAP/bFU9XqDiqQmt
 ZgcpShMxYuipN7od5m4myeckhITOtFtSYS+49tr686eZ2Lfw1fX3V0ZTzbdUui7U9Mhx
 LB599iXqwZPGJpPrRVLn2OlpeuDMVtjB5e1ZnUZPnCmHos8Xd/J0AEXy67BVHkCuFE9I
 moOw==
X-Gm-Message-State: AOAM532UoEN6eTOXQgAoYgvTVIQhNzK/F6TVXradIGPlvrtUEMzsnTj2
 9wa8jHF2TENQXEhCVYXjoz+H5A0L/5CUV6kk3yoYbQ==
X-Google-Smtp-Source: ABdhPJxhy/qzoluWYjYOMb7A0KCVNlZhUMsgs9xf7qnzDqzcAnK3IDdLkbBLK2xH2zYjTmbmGcdb5V0ia3byh3KJnKw=
X-Received: by 2002:a05:6402:17c6:: with SMTP id
 s6mr12221082edy.11.1636476597585; 
 Tue, 09 Nov 2021 08:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com> <20211109110331-mutt-send-email-mst@kernel.org>
 <YYqe4o9b+mHzwz0r@redhat.com>
In-Reply-To: <YYqe4o9b+mHzwz0r@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 9 Nov 2021 22:19:46 +0530
Message-ID: <CAARzgwyfB3zd0YBvvTDPu60W0xE_wk99-zGParKtp+jggLqmzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 9:46 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Nov 09, 2021 at 11:05:28AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Nov 09, 2021 at 02:29:26PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > > > The updated TPM related tables have the following additions:
> > > > >
> > > > >    Device (TPM)
> > > > >    {
> > > > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // =
_HID: Hardware ID
> > > > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > > > +      Name (_UID, One)  // _UID: Unique ID
> > > > >        Name (_STA, 0x0F)  // _STA: Status
> > > > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource=
 Settings
> > > > >
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > > Cc: Ani Sinha <ani@anisinha.ca>
> > > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > > ---
> > > > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 byte=
s
> > > > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 byte=
s
> > > > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > > > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > > > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > > > >  5 files changed, 11 deletions(-)
> > > >
> > > > A disadvantage to doing it like this is that git thinks
> > > > it's ok to replace any empty file with this, so if acpi
> > > > changed in any way git will happily resolve it
> > > > replacing it with this version.
> > >
> > > Do we actually need to be storing these binary files in git
> > > at all ?
> > >
> > > IIUC, the test will do two things
> > >
> > >  - memcmp the expected binary we store, against the new binary
> > >    we generated.
> > >  - if they differ, then disassemble both and report the
> > >    differences in a user friendly-ish way
> >
> > Second if iasl is installed.
> >
> > > What if we only stored the sha256 checksum of the binary
> >
> > Hmm, point being? Same some space?
> >
> > > *and*
> > > the dissasembled output in git, never the full binary.
> >
> > We used to. The issue is that dissasembled output depends
> > very much on the disassembler. Disassembling both
> > with the same tool is one way to address this.
>
> Oh, so new isal releases can change the format, that's
> annoying :-(

Additionally, depending on iasl binary being used, some tables may or
may not be properly interpreted or recognized. For example, the
existing iasl binary that comes with the dostro does not recognize the
new VIOT tables. One has to use a binary directly compiled from the
upstream iasl repo at this time.

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

