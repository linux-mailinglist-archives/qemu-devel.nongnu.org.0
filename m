Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCA6EAEA3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:03:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptDn-0005er-FG; Fri, 21 Apr 2023 12:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pptDd-0005bN-Bq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:02:43 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pptDb-0004Zx-Tl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:02:41 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-54fc1824f0bso20883877b3.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682092958; x=1684684958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nsiDB4RCa6Jx3gM8FRCQCg4nL8MkOLbxm11tk6qqht4=;
 b=YBplrLw3qvgZYnTx7xSVGm8U9Xvx0i7WHe7KMcoJcAZ/Embh/gREzhhQXkY2bBw+zs
 WJJdr7g7FvA4LlZDr0Bu6xaKnX6R81BDzz4IWVN0W11SoM3d7nR1ABTuHLmJobAojmtn
 3wOxPCMF6L3lCs8T9cEELIeFNjOpjPbfg9x5cK4eCjjOG4DwKd2cmRyPgHMb5UolTNKR
 mSn3XW7Uyyu+/cWjJaMIYWJv4PnUrmxxQEu/RLjA9FYIGkK5rymb7ykaSxZMtxv/Lm5c
 9Zz1N8fXhf/z+8btKhKwUgrIyk1NeSigQxXcwf9+2MLmdLZQs2Qsrt08TiiIix7HMoWL
 gKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682092958; x=1684684958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nsiDB4RCa6Jx3gM8FRCQCg4nL8MkOLbxm11tk6qqht4=;
 b=H76/4gwmEnC6SgF4KF6IhDvvbGdFHvUbCIqvh5mOygC6s7ImeVNMVq39zdZIYzSJvS
 RRApe/pwexREbX7xrIabsXqWsmcP/DaOlYvcn0yQ75CWdml4aYW9CAsvFujMZo2mQnuV
 2Rt1ZFMYutFsAKJE30lwLIAtuOP1pPo3tRbxWFTqteCa2vanfHX0QgVXIRM/CBLGo38p
 fj8dbi/SV9Mxo+GMmGem+9FkSCfoPFUId3EEJ8CLXQKUqgwur+60hug2e4FZMPkKUUC8
 hNwTwQIwveQurxPsElpfARIcyZzv8AAijy5FCz8Jp9FTLoG0pKewv3ltO+yl6156YuVr
 CiNg==
X-Gm-Message-State: AAQBX9cj0Yws3wkNwqGkDR3xO4wtLAe6FCNSGZodOjeZI5ZX0ZKxk+VU
 u4HLfQC1ZkYVBfxvCB2NuzOR6l2uk1wgAI9Gb/4=
X-Google-Smtp-Source: AKy350YdK63RNUwZLZpWi16SgYTJRbfTfhHlP5NE/cos56T2DMx6qHIlesq+xrKlf3Xn8zT7ODa9r4RyZXUF0B9D7Uk=
X-Received: by 2002:a0d:eb8b:0:b0:54e:989d:f2f4 with SMTP id
 u133-20020a0deb8b000000b0054e989df2f4mr2139802ywe.35.1682092958400; Fri, 21
 Apr 2023 09:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 21 Apr 2023 12:02:26 -0400
Message-ID: <CAJSP0QVrxSgFJFqPd=iBfBoV9brL2v6d6P+4E7BmGYAxwEYPmw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] gfxstream + rutabaga_gfx: a surprising delight
 or startling epiphany?
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> From: Gurchetan Singh <gurchetansingh@google.com>
>
> Rationale:
>
> - gfxstream [a] is good for the Android Emulator/upstream QEMU
>   alignment
> - Wayland passhthrough [b] via the cross-domain context type is good
>   for Linux on Linux display virtualization
> - rutabaga_gfx [c] sits on top of gfxstream, cross-domain and even
>   virglrenderer
> - This series ports rutabaga_gfx to QEMU

What rutabaga_gfx and gfxstream? Can you explain where they sit in the
stack and how they build on or complement virtio-gpu and
virglrenderer?

Stefan

