Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0816D4BEA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:30:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjM7N-00067J-C8; Mon, 03 Apr 2023 11:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pjM7L-000677-EO; Mon, 03 Apr 2023 11:29:11 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pjM7J-0001fs-Vk; Mon, 03 Apr 2023 11:29:11 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-544f7c176easo558411097b3.9; 
 Mon, 03 Apr 2023 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680535748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TZtjFM4VnmDCcKjtj0fnpFYVzIw9smp2QLPxu8dMccQ=;
 b=bjy6EO4mkysAB6tfsOSYveSFQZmhz8SnGNdhLG/zkTXUaBOxMAuWsGZkiRDG8S4JRu
 t3AtAacM/vL6DmFwWFenktnbvLTZ7Q0hK1B1CZo5UDgwjs4hiGw9I6XkJON5ugbY9Cwh
 XD3shJ+erJ8GgiC7bcJs7I4Zv9+1MPgEG+STai8h6S7e+w+jAdBCEVPH95JDpEJGI8K/
 KGtJMQTb9wG97N2JzWHQMo09DOpdnBpwk28uvqJFMTI7sgfYnHrxzdR4el3WUk0u7syL
 8iIWaM8wjyt/YCtS7/JKlamA/hDgogzEyxZWWwWMGCfVz8zABDkn85l8Sb90SHHeLnPI
 7iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZtjFM4VnmDCcKjtj0fnpFYVzIw9smp2QLPxu8dMccQ=;
 b=2ugSN/sR/rDHOs9z5yXQTiUUBXWkdVKqKHF8IX/xy+Xwysr4WzArt6DcUvpx+ZppWU
 EdBC7gmZFaqFc+j+JnLwzZt2034+0kQ5/QM1XPyg5k6I0Vjr2mxjGhw4i9iRaUIx2zDu
 F5PZrREa7pApFbsiZRPOfAAWqUKA/5PRiIs9ta8j1SyeNEfjVI04+hQKhcsDAQYfWP/V
 77hDx9kQPB5sSOehJ/Pi9mhGVp6mYW595Snd+5IDlq9X5KCHXmjTXIm/fAyBVtJKTT+4
 wAcpsGDVDsebtmO8+GdHGC2/CdMfvnNYwC+vpUoLBRtSgt4BWSaK4m0tYko5ifv/AcNL
 AsSA==
X-Gm-Message-State: AAQBX9dKCElm0C8kyuvuyhZFkjMBjjpwEi44jJ8JgUVXhXfUgEvJQroy
 0N+FTncC2FN5HZ/JBWHWkgYobfYA7oKoJJndPNk=
X-Google-Smtp-Source: AKy350ZrcyfQoa1PRTqq46GND/TBUhzIBVufVWN86wL0YmsvE3xRIi43bZjHfRlAWBmrIBovuQTcnBRF4T6e5ZpQ8YA=
X-Received: by 2002:a81:be0f:0:b0:542:927b:1c79 with SMTP id
 i15-20020a81be0f000000b00542927b1c79mr10215120ywn.3.1680535748598; Mon, 03
 Apr 2023 08:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230324090605.28361-1-faithilikerun@gmail.com>
 <41f2ee75-0465-94d4-90bb-7289e49fdb5d@linaro.org>
In-Reply-To: <41f2ee75-0465-94d4-90bb-7289e49fdb5d@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 3 Apr 2023 11:28:56 -0400
Message-ID: <CAJSP0QWj4w5rhFZEw4asJ2oyidEbdhDeD+98j1zf67QRPBTdrg@mail.gmail.com>
Subject: Re: [PATCH v18 0/8] Add support for zoned device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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

Thanks, applied with Philippe's suggested commit message changes:
https://gitlab.com/stefanha/qemu/-/tree/block-next

I left the trace events commit separate.

Stefan

