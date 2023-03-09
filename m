Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6D6B3038
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 23:11:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paOSM-00041k-Kd; Thu, 09 Mar 2023 17:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1paOSK-00041P-4V
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:09:48 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1paOSI-00061k-8Y
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:09:47 -0500
Received: by mail-ed1-x533.google.com with SMTP id cw28so13013983edb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 14:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678399782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7w8VbHSSP0+IhUIGMeTxJOQl+mQhK37QrDyCaS8wAXY=;
 b=JUgahBLzPfrN9jHXSVPtxr7PBqSJD9ug1DWaB0fSuuyfavbIB2QuaDZU03ikVg4UV8
 bbhlS2l/FXgXmNfzbo0dO3bpf3aIwtwOMZdEzS3nj5Vud8wKeLyc/xFz14Qg9I0ODjjS
 +5c6bNOrzg3cHERtg3MXDoSI2dyBjcvZzBMDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678399782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7w8VbHSSP0+IhUIGMeTxJOQl+mQhK37QrDyCaS8wAXY=;
 b=nHQl4CCzRLLX65pZfB+SUVuVW21o2BGYec/1twRwigXDKwWGqvLlamWFjvH7NI7eq9
 t+r+3wNmVvDKPKWVNF4f3Gmd8SQBe8XubkxAOpR9VvTT4Volhum7HH8gC6MZo4coSSo4
 pP/gWY2Kj5mTKT/9i3i1IKc0xliyQBwUKDETzvXHUYEaQWmflITLmTAdSWDn9qmwofKD
 4kltUtKaZZXTEdkKANOLfX4oIrYGNljyCTEACqAq8AqhE2FgOoINBpzviOEE28JGSCRx
 U8l0YayycHYpSls2VIPUIepSQXF9QOaPZUHCzUpzw11EnQ0xprZBdWljIGoAca5VSF94
 cpbw==
X-Gm-Message-State: AO0yUKXCvNFoQgTbxErA4oXVqy9jg1PT7onvnuYDBu1xhkepR75SlKXo
 uprhKc+h/4AYn3wzi4+hCwofdqaWunpRRlWOgalN/w==
X-Google-Smtp-Source: AK7set8OR/AOsLxRvkFqDJoXE4EnHDYiV3vA2eEI2RFiA9E4VNv4pzBp0NQyoLeHYKmSrO0JUMTtRl8ueuvlZMPHnfQ=
X-Received: by 2002:a17:906:5811:b0:877:747d:4a90 with SMTP id
 m17-20020a170906581100b00877747d4a90mr12082673ejq.14.1678399781837; Thu, 09
 Mar 2023 14:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20230309115714.906369-1-kraxel@redhat.com>
 <20230309115714.906369-4-kraxel@redhat.com>
In-Reply-To: <20230309115714.906369-4-kraxel@redhat.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 9 Mar 2023 14:09:30 -0800
Message-ID: <CAPnjgZ2KaWyCCFAQMzkKO-mG+iQtQs3n_7gtnJHYQUHQjBO4Qw@mail.gmail.com>
Subject: Re: [PULL 3/3] edk2: update firmware binaries
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=sjg@google.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Hi Gerd,

Where did these binaries come from? What commit and how were they built?

Regards,
Simon

