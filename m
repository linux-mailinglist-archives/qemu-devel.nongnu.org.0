Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8D67DF11
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 09:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLK50-0004iC-TF; Fri, 27 Jan 2023 03:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLK4w-0004hw-Gz
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:27:22 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLK4v-000320-4W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:27:22 -0500
Received: by mail-yb1-xb32.google.com with SMTP id d132so5104405ybb.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pOwx57BEnw7M2l538auYjhu43iawfXuJB4gywRQ7iqk=;
 b=SYGpIiQpRW2sxEJXk2zCYLvR4fVjCHQG5Zu9iFKVFUeZ3IA+U0TJm7hxcMXOPYXxug
 fGbDGZOHK7n1UuaXttJ0m+AwmGhigfOyWir3PMvuOK349OlzPpCk07mkuYukybAflBIz
 4soorYyN3/Rk3J/UqiZR/U+xOZX4zenxOa1no8iDGHbTU4Sy8nQCPMvoIKrWLTTKPQ+B
 YyWHqD14oyrAiBWI9zo6w5eozCiIMl3x/jGWhuJaPiObCpfaw/v/GOfoZ5SqvHJhuLn3
 ai94Pjw69oDxz/myBAEEriB06qh9MFO4iXcc5Q3p0wU9M7DeBfyVrH0ttz4kfdupfJ9E
 UuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pOwx57BEnw7M2l538auYjhu43iawfXuJB4gywRQ7iqk=;
 b=DYTd7Sm1eOzpJUTU6aTPMkPFRFQjEmb2dgiTSi0kXMeIGeG1spwGf3AqEsRVt607xQ
 25sPBX12R8hBKKLS/Ow42OxM4s0geTcLt4g6c2O3fcY6c8IEjEfWXHtQGM+FjDKRRs2E
 LuGlxoRYdbsRLWQ3MKCm2zgUn6sf+cRP7t12UEq/iU/CoUt33XMURpidSOo2/KApTbyd
 Us5SSARkd0Zes20MAGiSezBKgmlvSfhmnKoU1Y+YF/mDaWQ/GRwXEB5MCsmcAYK1f5Iq
 10fuQmValW1ldTPxLqT+NNKqq+YgIjJmAcq4M/NmOdrXNbSneCdcRoDBBDdxgh2ay5tx
 ffGQ==
X-Gm-Message-State: AO0yUKUyQY8Udu+6nN+ADLf5yBZcjS3s4kcie9DT2VbbE5VupNdK+O+L
 SeThCIGDxX6tXcZRk/MvgbHeb6O9Qx47mCAOKbVhBxU1
X-Google-Smtp-Source: AK7set+XLqOT9pjsXNMsdmhbFfwJUae1e+0GRTmzWSAs0EzdacUBFQhhni3FvFK4Hm552KV1JLRBMVSdO+70974PB1U=
X-Received: by 2002:a25:e0cd:0:b0:80b:7727:8363 with SMTP id
 x196-20020a25e0cd000000b0080b77278363mr1099560ybg.366.1674808039725; Fri, 27
 Jan 2023 00:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20230127055811.3468268-1-kraxel@redhat.com>
In-Reply-To: <20230127055811.3468268-1-kraxel@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 27 Jan 2023 03:27:07 -0500
Message-ID: <CAJSP0QU8QFPbiG1BaEJCOFeNhK4TcGE011-3n8dRNP7mvGbK7w@mail.gmail.com>
Subject: Re: [PATCH] microvm: update outdated docs
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
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

On Fri, 27 Jan 2023 at 00:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Cc: Sergio Lopez <slp@redhat.com>
> Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/system/i386/microvm.rst | 52 +++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 33 deletions(-)

Thank you!

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

