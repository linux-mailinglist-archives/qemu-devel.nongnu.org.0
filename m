Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7348B899
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:25:21 +0100 (CET)
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Nho-0008Qs-3h
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:25:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7NCs-0000PZ-EW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7NCp-0008KV-Tt
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641930799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5VOeO2QzcVPd/xc7X8R22sDBo/7uFFqVev6Ob+q8cM=;
 b=Nh06hJqRYmkBjBTG5tKRFwm0TACxHXD/I2BcStg2crXPKMwd1XFrjpgRtb9qn1RUTTVuYX
 LPXhNFA+0v04mfzts44ESsKyKaJGkmS+dYqfIqT+EhGPmNJxFQe+1bqPbxFw7dl3Qab5VS
 J4gK70tYYUgWdkY8BPRW9Ub1Ud69XMc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-cdiO4M0IP2i2nvUvzCNsEA-1; Tue, 11 Jan 2022 14:53:15 -0500
X-MC-Unique: cdiO4M0IP2i2nvUvzCNsEA-1
Received: by mail-ua1-f69.google.com with SMTP id
 g28-20020ab016dc000000b002fb2c2eb14aso171868uaf.11
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 11:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5VOeO2QzcVPd/xc7X8R22sDBo/7uFFqVev6Ob+q8cM=;
 b=KNilbyNFXLjo5doMTQEYcqA/MUsurPDAkX6qUkXcFGKE8DzZEMY+S/NYxNkrEX1xzF
 ubsuE9i/o9TQEbGG7yT2s0S0T1A9mUCgUCQgLybNI2gD2hIrWllxKR+dLa+jz3phRVde
 Ef298/HZlyE/+x2NEQvJJQ3Vb63VGnnJe3pzvSFiEYibmR0r4PMmHM/MhL6eqZ2Sny+8
 mHvsouFzNq8MKCzY50hO86gTd6n3Qz0ED4hFCAa8255Bgerne1d1bkj7PF47K+HInjNT
 8BdX3myN7ku425ozViM9fogFcRgfmlku/ee+0LMHtiBB32AuEhlRtbxqiFD8PMCghZXT
 YiqQ==
X-Gm-Message-State: AOAM5332WOKVBC1ScU2rJdMQpQZ+l53biU/ljlj9S40IG3aGn7DSPp1B
 ATFrD5qTPbrbwdlAT159uyx1NLruC3tNnmk+DpmY+06XOsdRoLzoMMuJcRaswYsEwhzUkJraXtG
 71+G1RGi5qftUR5IvXMq7JZUHaCrlcxc=
X-Received: by 2002:a05:6122:b64:: with SMTP id
 h4mr3051746vkf.24.1641930795386; 
 Tue, 11 Jan 2022 11:53:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR/K5q4wt4ORgj5sd4hZvrNUEXY4sOI+LxpFmc/CuYHXUA+E6E1XT5Ywmty5QBP+q5LSsFnsymUeTR5YHc1rM=
X-Received: by 2002:a05:6122:b64:: with SMTP id
 h4mr3051739vkf.24.1641930795222; 
 Tue, 11 Jan 2022 11:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20211220081054.151515-1-thuth@redhat.com>
 <20211220081054.151515-4-thuth@redhat.com>
In-Reply-To: <20211220081054.151515-4-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 14:53:04 -0500
Message-ID: <CAFn=p-avbyXnDY87hgALnodfm6fj5jxppoFDNYwmCfzj+__vfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/qtest/cdrom-test: Check whether devices are
 available before using them
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cb9a9d05d553cd68"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cb9a9d05d553cd68
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 20, 2021 at 3:11 AM Thomas Huth <thuth@redhat.com> wrote:

> Downstream users might want to disable legacy devices in their binaries,
> so we should not blindly assume that they are available. Add some proper
> checks before using them.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/cdrom-test.c | 60 ++++++++++++++++++++++++++--------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index c1fcac5c45..cfca24fa94 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -142,21 +142,36 @@ static void add_x86_tests(void)
>          qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
>                              "-drive if=ide,media=cdrom,file=",
> test_cdboot);
>      }
> -    qtest_add_data_func("cdrom/boot/am53c974",
> -                        "-device am53c974 -device scsi-cd,drive=cd1 "
> -                        "-drive if=none,id=cd1,format=raw,file=",
> test_cdboot);
> -    qtest_add_data_func("cdrom/boot/dc390",
> -                        "-device dc390 -device scsi-cd,drive=cd1 "
> -                        "-blockdev file,node-name=cd1,filename=",
> test_cdboot);
> -    qtest_add_data_func("cdrom/boot/lsi53c895a",
> -                        "-device lsi53c895a -device scsi-cd,drive=cd1 "
> -                        "-blockdev file,node-name=cd1,filename=",
> test_cdboot);
> -    qtest_add_data_func("cdrom/boot/megasas", "-M q35 "
> -                        "-device megasas -device scsi-cd,drive=cd1 "
> -                        "-blockdev file,node-name=cd1,filename=",
> test_cdboot);
> -    qtest_add_data_func("cdrom/boot/megasas-gen2", "-M q35 "
> -                        "-device megasas-gen2 -device scsi-cd,drive=cd1 "
> -                        "-blockdev file,node-name=cd1,filename=",
> test_cdboot);
> +    if (qtest_has_device("am53c974")) {
> +        qtest_add_data_func("cdrom/boot/am53c974",
> +                            "-device am53c974 -device scsi-cd,drive=cd1 "
> +                            "-drive if=none,id=cd1,format=raw,file=",
> +                            test_cdboot);
> +    }
> +    if (qtest_has_device("dc390")) {
> +        qtest_add_data_func("cdrom/boot/dc390",
> +                            "-device dc390 -device scsi-cd,drive=cd1 "
> +                            "-blockdev file,node-name=cd1,filename=",
> +                            test_cdboot);
> +    }
> +    if (qtest_has_device("lsi53c895a")) {
> +        qtest_add_data_func("cdrom/boot/lsi53c895a",
> +                            "-device lsi53c895a -device scsi-cd,drive=cd1
> "
> +                            "-blockdev file,node-name=cd1,filename=",
> +                            test_cdboot);
> +    }
> +    if (qtest_has_device("megasas")) {
> +        qtest_add_data_func("cdrom/boot/megasas", "-M q35 "
> +                            "-device megasas -device scsi-cd,drive=cd1 "
> +                            "-blockdev file,node-name=cd1,filename=",
> +                            test_cdboot);
> +    }
> +    if (qtest_has_device("megasas-gen2")) {
> +        qtest_add_data_func("cdrom/boot/megasas-gen2", "-M q35 "
> +                            "-device megasas-gen2 -device
> scsi-cd,drive=cd1 "
> +                            "-blockdev file,node-name=cd1,filename=",
> +                            test_cdboot);
> +    }
>  }
>
>  static void add_s390x_tests(void)
> @@ -171,12 +186,15 @@ static void add_s390x_tests(void)
>                          "-drive
> driver=null-co,read-zeroes=on,if=none,id=d1 "
>                          "-device virtio-blk,drive=d2,bootindex=1 "
>                          "-drive if=none,id=d2,media=cdrom,file=",
> test_cdboot);
> -    qtest_add_data_func("cdrom/boot/without-bootindex",
> -                        "-device virtio-scsi -device virtio-serial "
> -                        "-device x-terminal3270 -device
> virtio-blk,drive=d1 "
> -                        "-drive
> driver=null-co,read-zeroes=on,if=none,id=d1 "
> -                        "-device virtio-blk,drive=d2 "
> -                        "-drive if=none,id=d2,media=cdrom,file=",
> test_cdboot);
> +    if (qtest_has_device("x-terminal3270")) {
> +        qtest_add_data_func("cdrom/boot/without-bootindex",
> +                            "-device virtio-scsi -device virtio-serial "
> +                            "-device x-terminal3270 -device
> virtio-blk,drive=d1 "
> +                            "-drive
> driver=null-co,read-zeroes=on,if=none,id=d1 "
> +                            "-device virtio-blk,drive=d2 "
> +                            "-drive if=none,id=d2,media=cdrom,file=",
> +                            test_cdboot);
> +    }
>  }
>
>  int main(int argc, char **argv)
> --
> 2.27.0
>
>
Acked-by: John Snow <jsnow@redhat.com>

These are really more your tests than mine :)

--js

--000000000000cb9a9d05d553cd68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgRGVj
IDIwLCAyMDIxIGF0IDM6MTEgQU0gVGhvbWFzIEh1dGggJmx0OzxhIGhyZWY9Im1haWx0bzp0aHV0
aEByZWRoYXQuY29tIj50aHV0aEByZWRoYXQuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij5Eb3duc3RyZWFtIHVzZXJzIG1pZ2h0IHdhbnQgdG8gZGlzYWJsZSBsZWdhY3kgZGV2aWNl
cyBpbiB0aGVpciBiaW5hcmllcyw8YnI+DQpzbyB3ZSBzaG91bGQgbm90IGJsaW5kbHkgYXNzdW1l
IHRoYXQgdGhleSBhcmUgYXZhaWxhYmxlLiBBZGQgc29tZSBwcm9wZXI8YnI+DQpjaGVja3MgYmVm
b3JlIHVzaW5nIHRoZW0uPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEh1dGggJmx0
OzxhIGhyZWY9Im1haWx0bzp0aHV0aEByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+dGh1dGhA
cmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqB0ZXN0cy9xdGVzdC9jZHJvbS10ZXN0
LmMgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tPGJyPg0KwqAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pPGJyPg0KPGJy
Pg0KZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2Nkcm9tLXRlc3QuYyBiL3Rlc3RzL3F0ZXN0L2Nk
cm9tLXRlc3QuYzxicj4NCmluZGV4IGMxZmNhYzVjNDUuLmNmY2EyNGZhOTQgMTAwNjQ0PGJyPg0K
LS0tIGEvdGVzdHMvcXRlc3QvY2Ryb20tdGVzdC5jPGJyPg0KKysrIGIvdGVzdHMvcXRlc3QvY2Ry
b20tdGVzdC5jPGJyPg0KQEAgLTE0MiwyMSArMTQyLDM2IEBAIHN0YXRpYyB2b2lkIGFkZF94ODZf
dGVzdHModm9pZCk8YnI+DQrCoCDCoCDCoCDCoCDCoHF0ZXN0X2FkZF9kYXRhX2Z1bmMoJnF1b3Q7
Y2Ryb20vYm9vdC9pc2FwYyZxdW90OywgJnF1b3Q7LU0gaXNhcGMgJnF1b3Q7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDstZHJpdmUgaWY9aWRl
LG1lZGlhPWNkcm9tLGZpbGU9JnF1b3Q7LCB0ZXN0X2NkYm9vdCk7PGJyPg0KwqAgwqAgwqB9PGJy
Pg0KLcKgIMKgIHF0ZXN0X2FkZF9kYXRhX2Z1bmMoJnF1b3Q7Y2Ryb20vYm9vdC9hbTUzYzk3NCZx
dW90Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7LWRl
dmljZSBhbTUzYzk3NCAtZGV2aWNlIHNjc2ktY2QsZHJpdmU9Y2QxICZxdW90Ozxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZHJpdmUgaWY9bm9uZSxpZD1j
ZDEsZm9ybWF0PXJhdyxmaWxlPSZxdW90OywgdGVzdF9jZGJvb3QpOzxicj4NCi3CoCDCoCBxdGVz
dF9hZGRfZGF0YV9mdW5jKCZxdW90O2Nkcm9tL2Jvb3QvZGMzOTAmcXVvdDssPGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy1kZXZpY2UgZGMzOTAgLWRldmlj
ZSBzY3NpLWNkLGRyaXZlPWNkMSAmcXVvdDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJnF1b3Q7LWJsb2NrZGV2IGZpbGUsbm9kZS1uYW1lPWNkMSxmaWxlbmFtZT0m
cXVvdDssIHRlc3RfY2Rib290KTs8YnI+DQotwqAgwqAgcXRlc3RfYWRkX2RhdGFfZnVuYygmcXVv
dDtjZHJvbS9ib290L2xzaTUzYzg5NWEmcXVvdDssPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICZxdW90Oy1kZXZpY2UgbHNpNTNjODk1YSAtZGV2aWNlIHNjc2ktY2Qs
ZHJpdmU9Y2QxICZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmcXVvdDstYmxvY2tkZXYgZmlsZSxub2RlLW5hbWU9Y2QxLGZpbGVuYW1lPSZxdW90OywgdGVz
dF9jZGJvb3QpOzxicj4NCi3CoCDCoCBxdGVzdF9hZGRfZGF0YV9mdW5jKCZxdW90O2Nkcm9tL2Jv
b3QvbWVnYXNhcyZxdW90OywgJnF1b3Q7LU0gcTM1ICZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZGV2aWNlIG1lZ2FzYXMgLWRldmljZSBzY3Np
LWNkLGRyaXZlPWNkMSAmcXVvdDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgJnF1b3Q7LWJsb2NrZGV2IGZpbGUsbm9kZS1uYW1lPWNkMSxmaWxlbmFtZT0mcXVvdDss
IHRlc3RfY2Rib290KTs8YnI+DQotwqAgwqAgcXRlc3RfYWRkX2RhdGFfZnVuYygmcXVvdDtjZHJv
bS9ib290L21lZ2FzYXMtZ2VuMiZxdW90OywgJnF1b3Q7LU0gcTM1ICZxdW90Ozxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZGV2aWNlIG1lZ2FzYXMtZ2Vu
MiAtZGV2aWNlIHNjc2ktY2QsZHJpdmU9Y2QxICZxdW90Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstYmxvY2tkZXYgZmlsZSxub2RlLW5hbWU9Y2QxLGZp
bGVuYW1lPSZxdW90OywgdGVzdF9jZGJvb3QpOzxicj4NCivCoCDCoCBpZiAocXRlc3RfaGFzX2Rl
dmljZSgmcXVvdDthbTUzYzk3NCZxdW90OykpIHs8YnI+DQorwqAgwqAgwqAgwqAgcXRlc3RfYWRk
X2RhdGFfZnVuYygmcXVvdDtjZHJvbS9ib290L2FtNTNjOTc0JnF1b3Q7LDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZGV2aWNlIGFtNTNjOTc0
IC1kZXZpY2Ugc2NzaS1jZCxkcml2ZT1jZDEgJnF1b3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy1kcml2ZSBpZj1ub25lLGlkPWNkMSxmb3Jt
YXQ9cmF3LGZpbGU9JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB0ZXN0X2NkYm9vdCk7PGJyPg0KK8KgIMKgIH08YnI+DQorwqAgwqAgaWYgKHF0
ZXN0X2hhc19kZXZpY2UoJnF1b3Q7ZGMzOTAmcXVvdDspKSB7PGJyPg0KK8KgIMKgIMKgIMKgIHF0
ZXN0X2FkZF9kYXRhX2Z1bmMoJnF1b3Q7Y2Ryb20vYm9vdC9kYzM5MCZxdW90Oyw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7LWRldmljZSBkYzM5
MCAtZGV2aWNlIHNjc2ktY2QsZHJpdmU9Y2QxICZxdW90Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstYmxvY2tkZXYgZmlsZSxub2RlLW5hbWU9
Y2QxLGZpbGVuYW1lPSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgdGVzdF9jZGJvb3QpOzxicj4NCivCoCDCoCB9PGJyPg0KK8KgIMKgIGlmIChx
dGVzdF9oYXNfZGV2aWNlKCZxdW90O2xzaTUzYzg5NWEmcXVvdDspKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIHF0ZXN0X2FkZF9kYXRhX2Z1bmMoJnF1b3Q7Y2Ryb20vYm9vdC9sc2k1M2M4OTVhJnF1b3Q7
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDst
ZGV2aWNlIGxzaTUzYzg5NWEgLWRldmljZSBzY3NpLWNkLGRyaXZlPWNkMSAmcXVvdDs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7LWJsb2NrZGV2
IGZpbGUsbm9kZS1uYW1lPWNkMSxmaWxlbmFtZT0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRlc3RfY2Rib290KTs8YnI+DQorwqAgwqAgfTxi
cj4NCivCoCDCoCBpZiAocXRlc3RfaGFzX2RldmljZSgmcXVvdDttZWdhc2FzJnF1b3Q7KSkgezxi
cj4NCivCoCDCoCDCoCDCoCBxdGVzdF9hZGRfZGF0YV9mdW5jKCZxdW90O2Nkcm9tL2Jvb3QvbWVn
YXNhcyZxdW90OywgJnF1b3Q7LU0gcTM1ICZxdW90Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZGV2aWNlIG1lZ2FzYXMgLWRldmljZSBzY3Np
LWNkLGRyaXZlPWNkMSAmcXVvdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJnF1b3Q7LWJsb2NrZGV2IGZpbGUsbm9kZS1uYW1lPWNkMSxmaWxlbmFtZT0m
cXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRl
c3RfY2Rib290KTs8YnI+DQorwqAgwqAgfTxicj4NCivCoCDCoCBpZiAocXRlc3RfaGFzX2Rldmlj
ZSgmcXVvdDttZWdhc2FzLWdlbjImcXVvdDspKSB7PGJyPg0KK8KgIMKgIMKgIMKgIHF0ZXN0X2Fk
ZF9kYXRhX2Z1bmMoJnF1b3Q7Y2Ryb20vYm9vdC9tZWdhc2FzLWdlbjImcXVvdDssICZxdW90Oy1N
IHEzNSAmcXVvdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJnF1b3Q7LWRldmljZSBtZWdhc2FzLWdlbjIgLWRldmljZSBzY3NpLWNkLGRyaXZlPWNkMSAm
cXVvdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1
b3Q7LWJsb2NrZGV2IGZpbGUsbm9kZS1uYW1lPWNkMSxmaWxlbmFtZT0mcXVvdDssPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRlc3RfY2Rib290KTs8YnI+
DQorwqAgwqAgfTxicj4NCsKgfTxicj4NCjxicj4NCsKgc3RhdGljIHZvaWQgYWRkX3MzOTB4X3Rl
c3RzKHZvaWQpPGJyPg0KQEAgLTE3MSwxMiArMTg2LDE1IEBAIHN0YXRpYyB2b2lkIGFkZF9zMzkw
eF90ZXN0cyh2b2lkKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JnF1b3Q7LWRyaXZlIGRyaXZlcj1udWxsLWNvLHJlYWQtemVyb2VzPW9uLGlmPW5vbmUsaWQ9ZDEg
JnF1b3Q7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDst
ZGV2aWNlIHZpcnRpby1ibGssZHJpdmU9ZDIsYm9vdGluZGV4PTEgJnF1b3Q7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDstZHJpdmUgaWY9bm9uZSxpZD1k
MixtZWRpYT1jZHJvbSxmaWxlPSZxdW90OywgdGVzdF9jZGJvb3QpOzxicj4NCi3CoCDCoCBxdGVz
dF9hZGRfZGF0YV9mdW5jKCZxdW90O2Nkcm9tL2Jvb3Qvd2l0aG91dC1ib290aW5kZXgmcXVvdDss
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy1kZXZpY2Ug
dmlydGlvLXNjc2kgLWRldmljZSB2aXJ0aW8tc2VyaWFsICZxdW90Ozxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZGV2aWNlIHgtdGVybWluYWwzMjcwIC1k
ZXZpY2UgdmlydGlvLWJsayxkcml2ZT1kMSAmcXVvdDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7LWRyaXZlIGRyaXZlcj1udWxsLWNvLHJlYWQtemVyb2Vz
PW9uLGlmPW5vbmUsaWQ9ZDEgJnF1b3Q7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICZxdW90Oy1kZXZpY2UgdmlydGlvLWJsayxkcml2ZT1kMiAmcXVvdDs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7LWRyaXZlIGlmPW5vbmUs
aWQ9ZDIsbWVkaWE9Y2Ryb20sZmlsZT0mcXVvdDssIHRlc3RfY2Rib290KTs8YnI+DQorwqAgwqAg
aWYgKHF0ZXN0X2hhc19kZXZpY2UoJnF1b3Q7eC10ZXJtaW5hbDMyNzAmcXVvdDspKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIHF0ZXN0X2FkZF9kYXRhX2Z1bmMoJnF1b3Q7Y2Ryb20vYm9vdC93aXRob3V0
LWJvb3RpbmRleCZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgJnF1b3Q7LWRldmljZSB2aXJ0aW8tc2NzaSAtZGV2aWNlIHZpcnRpby1zZXJpYWwg
JnF1b3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZx
dW90Oy1kZXZpY2UgeC10ZXJtaW5hbDMyNzAgLWRldmljZSB2aXJ0aW8tYmxrLGRyaXZlPWQxICZx
dW90Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVv
dDstZHJpdmUgZHJpdmVyPW51bGwtY28scmVhZC16ZXJvZXM9b24saWY9bm9uZSxpZD1kMSAmcXVv
dDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7
LWRldmljZSB2aXJ0aW8tYmxrLGRyaXZlPWQyICZxdW90Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDstZHJpdmUgaWY9bm9uZSxpZD1kMixtZWRp
YT1jZHJvbSxmaWxlPSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgdGVzdF9jZGJvb3QpOzxicj4NCivCoCDCoCB9PGJyPg0KwqB9PGJyPg0KPGJy
Pg0KwqBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpPGJyPg0KLS0gPGJyPg0KMi4yNy4w
PGJyPg0KPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkFja2VkLWJ5OiBKb2hu
IFNub3cgJmx0OzxhIGhyZWY9Im1haWx0bzpqc25vd0ByZWRoYXQuY29tIj5qc25vd0ByZWRoYXQu
Y29tPC9hPiZndDs8L2Rpdj48ZGl2Pjxicj48L2Rpdj5UaGVzZSBhcmUgcmVhbGx5IG1vcmUgeW91
ciB0ZXN0cyB0aGFuIG1pbmUgOik8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGJyPjwv
ZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4tLWpzPGJyPjwvZGl2PjwvZGl2Pg0K
--000000000000cb9a9d05d553cd68--


