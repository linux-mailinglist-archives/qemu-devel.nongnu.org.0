Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F269E524
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVrZ-00061t-B8; Tue, 21 Feb 2023 11:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pUVrE-0005sA-9L
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:51:14 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pUVrC-0001Hb-60
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:51:11 -0500
Received: by mail-yb1-xb30.google.com with SMTP id i7so5999047ybu.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yijnp8tqJh90b6hApLd6rbiUmkEky5PoFc+Lw5BKD90=;
 b=gnn9ME5HLQPrTTb6zUSHGVZa886ae+AQMAJwmEnwEyrC4qpgcZS4yqdHXEkTSZRnSR
 HYBtKOxLGh937wLSvVKA4Ii9u18sfMVljUXB8RgQ+nmL8ZhoqT9+qXMii6JhPZUh4b5U
 0m1m1IzOxCgWM7R+r4Z+tyBYY3UQi9ebSrzvKIFnrzi7Bxsn3/Xk2TcVOS3kZeBK5CPd
 N7r9qfaNkbHCY2vOW02teT4VOmOXSmAG8xsJEBSzWUtguKO+jW1TlzkPLeevmQ442fPp
 sTluUHT1RSmjhZswYsEP9KXMxTiE0OKwSxD5oDPbMmkOO+YJuD+e6vbx8DNcGt2itMyB
 hbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yijnp8tqJh90b6hApLd6rbiUmkEky5PoFc+Lw5BKD90=;
 b=nriVf38KuotsSNCc1aJtxPQLP/kLqHypGpSXVOjbOeVeHkgZTSDxdzVVQ7NkjsKUcY
 aSEnZNijzophx8yBevAe41VfL7jnV+IPb+OFrM/FqIZsaQjKaDzIk+1a0Dae8k0gDl3v
 PPKb8OEQmP3JjoEpJ1DdvZGEDTDQC3q2ko5JCLxgEKJTIbBHtg66mOmt359uzs+nGD2z
 kWN0+fsdAtKdaRgfZL6nyc/ACmOFvr9WBgY/FoAnsbjhgwTlN7T+NWeuY+YxdbBZL2qZ
 SN1GNipjrWzKrR5tr4jseIy5AqFaKr/DgG+AzNMsaM8WFQBew6ISQu7TFulQrlWUx9FA
 wywQ==
X-Gm-Message-State: AO0yUKVaHtCY/cjGasi9kfGMkVzzUfdveL/dKmp0WqdaOAGOS+IpVAKx
 1sbZ8tOGDtU6M4SruLJqDWftWLHSVnvqKToakQ4=
X-Google-Smtp-Source: AK7set8DFrDqUQeiHB/LvaTIt3OK/bbENRiejndKwuIYYA35A9fvjd42zKtUqyBXjFQ6OctKxEhxHKp/m5SR9iKsegQ=
X-Received: by 2002:a5b:241:0:b0:95d:85ed:4594 with SMTP id
 g1-20020a5b0241000000b0095d85ed4594mr1042899ybp.513.1676998268684; Tue, 21
 Feb 2023 08:51:08 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <affc5c9d-5d66-4a27-ad94-bfb105a12bef@opensynergy.com>
 <CAJSP0QUbP+WZcureTMPRFTn+_uQoWhq+-f-hPq_LP=1ovMLpqw@mail.gmail.com>
In-Reply-To: <CAJSP0QUbP+WZcureTMPRFTn+_uQoWhq+-f-hPq_LP=1ovMLpqw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 21 Feb 2023 11:50:56 -0500
Message-ID: <CAJSP0QV1nsAwOOq2QH4hRrpm-vDfcqtn=azF+EsOCRpMM_G2Tg@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>, qemu-devel <qemu-devel@nongnu.org>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi everyone,
I have removed the project idea from the GSoC 2023 ideas list because
Stefano Garzarella is picking up Shreyansh's patches.

Stefan

