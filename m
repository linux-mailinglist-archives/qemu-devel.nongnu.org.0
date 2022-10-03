Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5BD5F3141
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLWC-0005NG-EQ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofLPF-0003hN-Ao
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:22:49 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:41750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofLPC-0006xO-Nr
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:22:49 -0400
Received: by mail-qt1-x829.google.com with SMTP id c11so6288868qtw.8
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=bkqIJ7NKSR831PTRIY9MGha4enu9pWS2k9iFtWbBtxM=;
 b=UvLoc38HDI83pv/qSLiaz47ax/yrW34wUPC60CAg5WUM3qmWgqpGUGTK5T1hjYyigS
 yxmSbJLA4l4bC+gZwGIlRHJ7dmVlp8EAVIt4p7UpuBYHx+VgEUaQd0ZbPL5OqMsqdWU/
 I+nG2yWu1Qk/tmdwv4+C/4qJzllHAlyOJk92C53aAreVA3MkfGoACGKwZH5ZH8+0uZqT
 yOclgK5bNoMq3uOvCpO3neniKZqmheJrRj9ua3+OipB7bN1lUmY/pW2iRxBms4uYkdtR
 /mZbD3b6jnWBoiJldz6qHFhHcM60y4yb7xtK8xg6mQfZvNNVnwsb+2bO6JKtSbWfaHA8
 VGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bkqIJ7NKSR831PTRIY9MGha4enu9pWS2k9iFtWbBtxM=;
 b=2tJEk27utb6Uh9v4TQGwMM1ARaN3HJBm3rbSrsV+1lC4wsO2UoF5ZOEKveQtWYSj06
 V0QxPvFV04k5GfXXVu5zpieYtsOlvqtfiynCLqV8q6QStiwgyaH59CW+y5RmYqtQw6vJ
 V8FjHpe4xwBZ6QNaKqS+9lhBkrdnev/nN42KA7W/Wb72mHYVKV05Fuo8g/Ku7LgOKSJ4
 bYZDvjGH+TJpHjTqSaMmnriUng5VHJFuyuxBppqjs187pEQVSRK6+VL7pkEt8ALir54o
 Vk+XRwBvgqAhX807/JgY1T/sDylD/hTcn/16szjeC2C1+mZnVUGgePXtPk9eZkm3qBhL
 tPdw==
X-Gm-Message-State: ACrzQf2Cv6FHUa6XTczwEZVcGvJh3H+saAYIQYOP+2vWCD9Lzm5zuuXU
 nEAcsNjk5TPOVuBbIbj/Bltv89L3ZEf/lLDYyMY=
X-Google-Smtp-Source: AMsMyM5qXyeW05emg69p/FhZ/FpHXpxG12KqJq/9qyvOt2XGSmw/dP0ovoZWMJsrJ+lk3os0pSemljq2RV+LTECrQdU=
X-Received: by 2002:a05:622a:4ca:b0:35d:539f:a35 with SMTP id
 q10-20020a05622a04ca00b0035d539f0a35mr15623775qtx.543.1664803365676; Mon, 03
 Oct 2022 06:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221003102718.600058-1-berrange@redhat.com>
 <20221003102718.600058-2-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-2-berrange@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 Oct 2022 21:22:35 +0800
Message-ID: <CAEUhbmXB1vL6p3kAZnH6=hvP0MsZ+tM_b1qVUt=b1cROSRjnWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] crypto: check for and report errors setting PSK
 credentials
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
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
> If setting credentials fails, the handshake will later fail to complete
> with an obscure error message which is hard to diagnose.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  crypto/tlscredspsk.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

