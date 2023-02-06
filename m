Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EB68BFFE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Q7-0008GI-Tj; Mon, 06 Feb 2023 09:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP2O0-000681-CQ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:22:25 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP2Ny-0006lG-Py
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:22:24 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-51ba4b1b9feso156794097b3.11
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oySTqIWvkQ2dqDR4P/OZ9VEMs3UWnufoaaOsPbnRAn8=;
 b=lxXxM+3dZxBuT8OQvzy2fuEOJINMmR8dOaxJ+5+p4zYBtvNO1UBQTfC/nHryMOeiCg
 HlUC01VFrMVU+URvX2GsUz5LfuSxOlrw7jQ8krJUPut9nWWzk0iTJfWARpZkppyYBIYw
 5vMxCoUZ8RgZaWsKhnbTjaIZkYx1NK21yBPMYzgw98PGE7iVKRerTt4IARuQezqVGwYd
 kk9uKGUsq1IcST3ISUq6G9wSW339WhTmKS45SmHz4206ZEPP6bNA7ErvtT2Qm6wXH8xb
 erfwFQo4pEDBFa7cLLM4xqLLgD+5iTW2kT1EAYe3UZPOQwDB/6SyKjhyS4XpHEC+eQIj
 AO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oySTqIWvkQ2dqDR4P/OZ9VEMs3UWnufoaaOsPbnRAn8=;
 b=aWfP5UEtwdqCzJwZxFByU29j2kUjTJzfH62n8Bo8wa1ft9PW2Z+wJvpP3FfXyM7o+S
 c4fGXR7QLUBA4cYbp0N8oxlMs2B61andIyyFulM62XZ/FDIeaLL1mdTgmb6zPZ3QHtBt
 DalWENPtdoQoVTBuRf1sPKX7zxdBPclb5TajLtRUyWJ/uVdPFHG+HLY4RE2xAuQw6Tmt
 SRhdHJMd9YoK2HC+IH0O2Nu4sxL1tNdHPdrtT+2ERqAeJGOXLk24KNNwC445dcvah3nb
 yr8P7gdOfKnfJgZBLIGIzEEdyLPCAcaMLp3XhtrdTqjpKX3uSw5wprHhmytALOO+RVUe
 Cynw==
X-Gm-Message-State: AO0yUKXyyLqrlYW4cm598kJPjtFcKIWjYcBvLUD9QfuSyBq2tV2E9Oq+
 yan4/S6sGPqlkYZdK8Sg1LVFh//3UMTLu10WwX0=
X-Google-Smtp-Source: AK7set/2HfzPmENFlON1dGVKgdVreMfUVvONeE6jFG6ljyADXdDDwYFOR0f9w3LkMBnifpkUmJuqmGrVhzM6e+L1PTk=
X-Received: by 2002:a05:690c:b9c:b0:476:b2b8:1c5f with SMTP id
 ck28-20020a05690c0b9c00b00476b2b81c5fmr2027819ywb.62.1675693341822; Mon, 06
 Feb 2023 06:22:21 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <affc5c9d-5d66-4a27-ad94-bfb105a12bef@opensynergy.com>
In-Reply-To: <affc5c9d-5d66-4a27-ad94-bfb105a12bef@opensynergy.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 09:22:08 -0500
Message-ID: <CAJSP0QUbP+WZcureTMPRFTn+_uQoWhq+-f-hPq_LP=1ovMLpqw@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
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

On Mon, 6 Feb 2023 at 03:33, Anton Yakovlev
<anton.yakovlev@opensynergy.com> wrote:
> If anything, I'm here. Not sure I'll have time to be a mentor, but if there
> are any questions I can answer, you're welcome.

Thank you, Anton!

Stefan

