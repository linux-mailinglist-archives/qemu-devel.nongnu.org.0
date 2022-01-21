Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7894964D2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:11:00 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyNH-0002yK-OZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyEJ-0004qr-Hc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyEG-0003tG-Mo
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642788060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8jKXXcSMAiZp9EXwXtk3P1etmtiPu8I9qjKOZAmwCs=;
 b=eN6E09UiveEnuNfNV0EQa1Dy2Q2XI2YpTlQp6u2s0HE9onOgZmJiJXXuLJnW3o50TR6HBk
 JtzavX5ZnLbIn+w+mxm4cXuCu9tz2wPjpadrceXAnzm6a9UJhHBqpLuhPBCte8E/IBVQTB
 My4lq4CMbsUZxHJh044+rA9av1tOBZ0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-1RAAVtvUOiSZ0t5zpM6Gbw-1; Fri, 21 Jan 2022 13:00:58 -0500
X-MC-Unique: 1RAAVtvUOiSZ0t5zpM6Gbw-1
Received: by mail-vk1-f197.google.com with SMTP id
 f189-20020a1f38c6000000b003192acc4f88so1636057vka.14
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 10:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N8jKXXcSMAiZp9EXwXtk3P1etmtiPu8I9qjKOZAmwCs=;
 b=R5lPKrAEDxVU3C/IFHQLcnQUqcueveplc9r50uLTra7kdrw+6vnlfertziTkWt3Fb9
 OBsayvn9K45wB3NgUTH2RUnCB6Qdi51B2/obEIghuQZw8/9+ytq/uT8jJSk7STrhact1
 WdRQIujjCXK9B4v88MRXgXiJIOxxqpsCbwbnosO6huwwocZ+qEv2QoVyBSXlunnqV2DH
 07NB8ehUvmQBKA6x/cq362W/tYLLa8/i59z/LNAwE05g4eJs9dFyT0OtwzfsdAKl1dYr
 0ryNKRGKLW2AnAqP/8uoB0DO3at1AYr7wDTBGDMviVaprf4ssY1bHJZaQ+d6jpG6snK5
 e0/g==
X-Gm-Message-State: AOAM532rXCfKU/2Jr7yJY/A7RlvmmNKdXMvVb+HxNKzbpqL+SpaVumsJ
 xK0WgUr8dkz1IsCvaRnGWj6BmEiezwiXpBrNbIXGbujeUbPT4WTUlyG1zWmiEQzSk8c8n2TDEDF
 tSTSpvfcgQa+oPGo37N8xigeu1Hv6xFc=
X-Received: by 2002:a67:6587:: with SMTP id z129mr2077162vsb.61.1642788057567; 
 Fri, 21 Jan 2022 10:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp0qP3EYGfMLNQpnrfKuxZ6+ofSz9HoY800fBoxEtF/emfIzu20g4qfH8kCYjILopsPd/BJkipxX3b/vOr7q8=
X-Received: by 2002:a67:6587:: with SMTP id z129mr2077151vsb.61.1642788057317; 
 Fri, 21 Jan 2022 10:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20220121120635.220644-1-thuth@redhat.com>
In-Reply-To: <20220121120635.220644-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 13:00:46 -0500
Message-ID: <CAFn=p-b7Fveafs8mC-bzEG937vvdfV_PLzzpK-_T=ujLWhENnA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/ide-test: Remove bad retry_isa test
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 7:06 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The retry_isa test is not doing what it was intended for: The
> test_retry_flush() function ignores the machine parameter completely
> and thus this test does not get run with the "isapc" machine.
> Moreover, in the course of time, the test_retry_flush() has been
> changed to depend on PCI-related functions, so this also cannot
> be fixed by simply using the machine parameter now. The correct
> fix would be to switch the whole test to libqos, but until someone
> has time to do this, let's simply drop the retry_isa test for now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I assume I had patches to make this make sense at some point, but
they're probably long lost to time by now. Please pardon my dust. =F0=9F=99=
=87

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  tests/qtest/ide-test.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 3f8081e77d..5f9d084052 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -701,7 +701,7 @@ static void test_flush(void)
>      free_pci_device(dev);
>  }
>
> -static void test_retry_flush(const char *machine)
> +static void test_pci_retry_flush(void)
>  {
>      QTestState *qts;
>      QPCIDevice *dev;
> @@ -790,16 +790,6 @@ static void test_flush_empty_drive(void)
>      ide_test_quit(qts);
>  }
>
> -static void test_pci_retry_flush(void)
> -{
> -    test_retry_flush("pc");
> -}
> -
> -static void test_isa_retry_flush(void)
> -{
> -    test_retry_flush("isapc");
> -}
> -
>  typedef struct Read10CDB {
>      uint8_t opcode;
>      uint8_t flags;
> @@ -1050,7 +1040,6 @@ int main(int argc, char **argv)
>      qtest_add_func("/ide/flush/nodev", test_flush_nodev);
>      qtest_add_func("/ide/flush/empty_drive", test_flush_empty_drive);
>      qtest_add_func("/ide/flush/retry_pci", test_pci_retry_flush);
> -    qtest_add_func("/ide/flush/retry_isa", test_isa_retry_flush);
>
>      qtest_add_func("/ide/cdrom/pio", test_cdrom_pio);
>      qtest_add_func("/ide/cdrom/pio_large", test_cdrom_pio_large);
> --
> 2.27.0
>


