Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA044AFDF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:58:49 +0100 (CET)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSaG-0007NO-1I
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkSXy-0005Q6-9p
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:56:26 -0500
Received: from [2a00:1450:4864:20::52d] (port=37531
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkSXw-0006c8-51
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:56:26 -0500
Received: by mail-ed1-x52d.google.com with SMTP id f8so77929591edy.4
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 06:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3H6D0TvwKbTukI17l/4BCEqyMlQugKwgCPhWwVN5xA4=;
 b=gltG3iPSAh+QY3DwyPcejNsIKP6zWGeE5zlW/G0kamc1odiXGg1W+8cZMSU9Bv0Dr6
 wXItRJiZjehLcfThT9K3/VtuEbkJXkP8uDz9PVmM+l+SJHKmWY6gViPS8YdgRTcX58uS
 H5meVvUdL3QXYQ5Mh9mF5YitcWzX4v73ZaY5uz64aUPHl+yaWcUeW4jdG8vNybjKiBgf
 5vZMDYfTB1pTV68UCSZVJrVbxyClWBe67/5Spme1fqW8D6up+Oap4CcZBZcje4ZsoDcA
 QiwE46TAAQ8QU7EFOzOtE2FvoDNQ+p+f1h9uAfpH0HHhE5nNIzBmvXBY2D0J4hgMutXq
 X1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3H6D0TvwKbTukI17l/4BCEqyMlQugKwgCPhWwVN5xA4=;
 b=UYEOYDUW4eJ1x6xIPFP+fWsHuTKiH2UXh3JpK+yqF5KpHFcz5tvRekTiYP1oGxI9Ui
 F0iW/mhZgQFCOybF9KcyFaQKuQRtQBkCaMCZ4LD9b7AXeuSoWEQS7WofBuZSUNrbdo5m
 DmcRkYiexXHZJAIeikQKxE1IFKSOkd2zkScin4dHefGM3wH8fquCOZVTcORvdG68MZtw
 kGc068FkBITcpCGjrHXXpmoTbwGeSx25HylsrhGEQx4xq0g8rJcJ5L5KH4Z+ge7xAqjG
 +1WKCwmCSADbZO8TB2z9Kuy0tyCneMSLZ13XH36wMNAgBp8Bh+uO2R70D8/kxiIZ2B5e
 AgSg==
X-Gm-Message-State: AOAM531wO14GrR5TR6c2cb5bd3ajc4yJsc7F/LXgZUNQ8yt39Z9O7u/G
 sGNPFquSdGx0OXQfC2KGSNgKzrybxbcr9jlDUtgqPw==
X-Google-Smtp-Source: ABdhPJzOJktwNxYXE1ASJGpAnOjbIm+zfJuIHMi5MPkQOsEV1L3z3ysHzdVg8wVcIsASeK9uhX7x5dVOkz3ITy42dfY=
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr10276551eji.132.1636469782270; 
 Tue, 09 Nov 2021 06:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com>
In-Reply-To: <YYqFxgu74BIh0ZjB@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 9 Nov 2021 20:26:11 +0530
Message-ID: <CAARzgwwmvb-BRpctZ+BsrS0BBsnSDXK4MZgKD5-YB_c83NbUiw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
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

On Tue, Nov 9, 2021 at 8:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > The updated TPM related tables have the following additions:
> > >
> > >    Device (TPM)
> > >    {
> > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID=
: Hardware ID
> > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > +      Name (_UID, One)  // _UID: Unique ID
> > >        Name (_STA, 0x0F)  // _STA: Status
> > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Set=
tings
> > >
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: Ani Sinha <ani@anisinha.ca>
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
> > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
> > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > >  5 files changed, 11 deletions(-)
> >
> > A disadvantage to doing it like this is that git thinks
> > it's ok to replace any empty file with this, so if acpi
> > changed in any way git will happily resolve it
> > replacing it with this version.
>
> Do we actually need to be storing these binary files in git
> at all ?
>
> IIUC, the test will do two things
>
>  - memcmp the expected binary we store, against the new binary
>    we generated.
>  - if they differ, then disassemble both and report the
>    differences in a user friendly-ish way
>
> What if we only stored the sha256 checksum of the binary *and*
> the dissasembled output in git, never the full binary.

If you are going down that path, why need the sha256 at all? The test
can disassemble the tables from qemu and only compare the disassembled
ASL.

>
> IIUC, that would give us the same level of diagnostic output
> from the test failures. The dissasembled output would then
> give us meaningful patches for reviewers to look at. The
> author wouldn't have to describe the difference in the
> commit message as Stefan has (helpfully) done here.
>
>
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

