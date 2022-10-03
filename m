Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E455F313A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:28:48 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLV0-0003Qa-Q3
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofLRA-00068M-S9
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:24:48 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofLR9-00078J-BX
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:24:48 -0400
Received: by mail-qt1-x82e.google.com with SMTP id gb14so6291726qtb.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=pjEF5iNaPzB+eIhR120Ykc4OSBL+OzQWaFKR3JMIaWU=;
 b=PlQpXoUWvTfHM62ECqvHCXApVsvykgaBPnxrZP9Vd5i4KNGca6hqdLhdOUjj76cJh8
 jl5loPpI3fo1FEFa3MzrtwdORV2WdG46cBdoLNCUq6RcfJD+cUhJL8lwKaf1q8oUSm7A
 a6K3pnLEE4LhmXROoHuBeUBdW7yEL/D1OIJ4h2n7f524iI4CJsUG07MqyoVmSX0IDAPZ
 uuQX8rV4OxId79YXuC6QvBJ13nQ+LAV8FhRcfBp85Uz0vtUjkI2SdI0u5J0L79VP3AzP
 f0vuNjZjG+aw1CBvhR9Nc9cVF/UgnXyB+c5UPmVDYE7tdtrP+YBRGc7vzszc5K1Z0PBr
 o2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pjEF5iNaPzB+eIhR120Ykc4OSBL+OzQWaFKR3JMIaWU=;
 b=xtaT37NngkYhQ3RfbL19sALPV/57o/VBIfTRKoLdg/nnFxTNPPuXXvuSIp4wh18MH1
 DtJ1Q/t1yXvZWkZdwev/punbWlbfpL8EWLvqjtG3zqZRHOgoOPiRiKTLH0k8Egfxt0LR
 nAAl4kIron/i8qIEr28XDfUER9oUCuOJMpNkBZHo5+4d1p6D28eNR+n1HJE6TT2LgL5u
 f4Dn583WDbJTA4tqKjPxXxIDbgPZhuqAORXGtJ+BtprW6MpwqKwKKuiCg+eXzpkEzIWy
 rHd8wA6NIggQ2e5jo4XbqFF9A4hpKhuFAGprXD26BFufhCJ14F8BbyEmF7ML22y9Fi7D
 6EJQ==
X-Gm-Message-State: ACrzQf111kmGABdn5loRPgdysaPO5mOsMaeFt9e+/5VSyHaMNAoB49Os
 hNj/1Pi7vq1khw7uCtzLhIuAjEXVKC2TidV1YqU=
X-Google-Smtp-Source: AMsMyM7VKYlQFFK1WWyBRr/arEu0KB1I/FS+HXWRHzi1rhkCa9jgeLjpvJB6YJJbEqE0S9dEvHrAURanJhqsrdt5rw8=
X-Received: by 2002:ac8:57ca:0:b0:35b:b51f:94fc with SMTP id
 w10-20020ac857ca000000b0035bb51f94fcmr15833682qta.276.1664803483854; Mon, 03
 Oct 2022 06:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221003102718.600058-1-berrange@redhat.com>
 <20221003102718.600058-3-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-3-berrange@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 Oct 2022 21:24:33 +0800
Message-ID: <CAEUhbmXAOirFnJZ0YRAnd3f-Uii1=-3UUjcCsdqvgW8QOz9hpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests: avoid DOS line endings in PSK file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 3, 2022 at 6:27 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> Using FILE * APIs for writing the PSK file results in translation from
> UNIX to DOS line endings on Windows. When the crypto PSK code later
> loads the credentials the stray \r will result in failure to load the
> PSK credentials into GNUTLS.
>
> Rather than switching the FILE* APIs to open in binary format, just
> switch to the more concise g_file_set_contents API.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/unit/crypto-tls-psk-helpers.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

