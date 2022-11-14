Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD1628ED3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiie-00027S-KX; Mon, 14 Nov 2022 18:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouieK-0001yn-5i
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:56 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oug7j-0007qs-QJ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 15:32:08 -0500
Received: by mail-yb1-xb29.google.com with SMTP id r3so14884484yba.5
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 12:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FspOV+VfeHq4TTjUxRrFG3lO6h/XO3tpF3VyYPjJKSI=;
 b=fgnR4eBWijfueOHQg9qNOoCIN/44IYyouWmOu5No6/TGgYJv1EaUD6amZYQoYcRmHM
 NuXJ9WH+EFpWznS5YwmutPOc+r033FUISiVElAMvic/qVYKoULI/e9c6kKjDkBd1DzGt
 0N26ZtOd82oPw3zQYr8SB8O2hgSd70CTPVt5X3gQfep/FHKtMt9Vy9Um6lMVpIO0Nl/W
 Gj8kwn5OmBTkcU2A6gs4yka+4c1hiUCt39i1xBlgU8wIXCLSqSQ9lVknweItBEDCd+EZ
 rXZNJLG6lDlU2ZyRTlbCDXexfeN1e1J+x9dDzq+GuuChjZpDlsCoa6htmY2Nmz8RsMnp
 CLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FspOV+VfeHq4TTjUxRrFG3lO6h/XO3tpF3VyYPjJKSI=;
 b=3lXgmYUWSYjRF5Kfledp557ZwiDaGOqyxK7uc446XWTvPCLh+yv6zrIAqAj53rtpC9
 zTv/UeRUv3Evv5JjVtnEBc7QKf1DLDOT00k+MmpW3AXIhUAcoLCuTlLot0LjkpLpP3TU
 avZlqO+SyZx/bAaEy3MpfZOr5BVpV0gDo0qBjyniOweDQs6g3zKUEXazt8ewT6MEUSok
 U+QYop1Gm8/93f+J/LNnzvLNJ0jEclT1eJIYwIcgB0OqK/rWwW6PYtnImziTbBCE3Gqu
 OV5xOp0tz32cLGqk7k8NleWI6Oq33JwsQmQ2B3FjlqJSQMMoBQwHWkh5CuFnnayAqbew
 3xtQ==
X-Gm-Message-State: ANoB5pni3CfnHIOSpZJDDw9d0H9BzwFOXiky09kQWxQhkidDcXYVvTSO
 LYWi5ERWvSEFiLnLqfdKuZnz7ukOcbV84Ien8SM=
X-Google-Smtp-Source: AA0mqf6rPfimMLq6EGB+bPzcr3zff+Cv5jNDz8jrhTp545vz2CgbwEWWQedw+XAMUz1XD8+Q74P8I3xSJIDVJCbU0iA=
X-Received: by 2002:a25:9390:0:b0:6de:eeb2:f427 with SMTP id
 a16-20020a259390000000b006deeeb2f427mr11963621ybm.366.1668457926209; Mon, 14
 Nov 2022 12:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20221028191648.964076-1-alxndr@bu.edu>
 <20221028191648.964076-2-alxndr@bu.edu>
In-Reply-To: <20221028191648.964076-2-alxndr@bu.edu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Nov 2022 15:31:54 -0500
Message-ID: <CAJSP0QXq=3vL-+A=AXD7dKaUSLNoM1aTnucE_hQSzfUJvGuZBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
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

The _guarded() calls are required in BHs, timers, fd read/write
callbacks, etc because we're no longer in the memory region dispatch
code with the reentrancy guard set. It's not clear to me whether the
_guarded() calls are actually required in most of these patches
though? Do you plan to convert every DMA API call to a _guarded() call
in the future?

I'm asking because coming up with an API that doesn't require these
code changes will reduce code churn and make existing code safe.

Does it make sense to separate the DMA API and the reentrancy guard
API? That way the reentrancy guard can be put in place once in any BH,
timer, etc callback and then the existing DMA APIs are used within
those callbacks without new _guarded() APIs.

This approach also reduces the number of times that the guard is
toggled. The current approach is fine-grained (per DMA API call) so
the guard needs to be toggled all the time, e.g. in DMA sglist loops.

If we want the compiler to prevent DMA API calls without a reentrancy
guard, then AddressSpace pointers can be hidden behind an API that
sets the guard. This ensures that you cannot access an address space
unless you have a reentrancy guard.

Stefan

