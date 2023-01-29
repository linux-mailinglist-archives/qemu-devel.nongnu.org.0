Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67347680229
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMFtD-0001j0-42; Sun, 29 Jan 2023 17:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMFt9-0001ii-Mx
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:11:04 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMFt8-00039s-3r
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:11:03 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-506609635cbso137837817b3.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3i8dxNRHWGRSBxA1HVBMDp2I5+H1/9S7hQmHWc1FHSU=;
 b=D3GUP8t1oQZ91SdSyQ6V3PWyyo4R+TPL9qrh84F9bqtuNlp8di+7fP2SrFOZKqkdNf
 TgMyZvdluSKfb+XtWDLzEUeMFfH/VVr7fJAeW1jGjZyN3EiXDKBDcCwHmTrPjqDWsFCq
 JMuIJQvwS2FY0c5WBahAARXV/bR+bEUKVPYo4du9eo/aw9/o0Sg/RZZA/PPHnH21aSmU
 FfQGToU2p8LsjWIo0XWDzyEeplb4APfMiGS38mLj1pTwb3nysPMEzCbB2KvJtTisprzR
 0b821mEKUFOgT9h6ciO+3uEE/uY2UIWEx48LyFR635aPtiOOftP/NEHeOJ6PZ4Ca1NQw
 42HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3i8dxNRHWGRSBxA1HVBMDp2I5+H1/9S7hQmHWc1FHSU=;
 b=nedpS52vhByejM5BBHwLlVd4eePX/3vlaeP/ved8FU3bo9+KmZ7K0FWV0kHo8YIMOS
 lUIDV6DkkrBWq6ly8rdXvnVjzKQcOuqvv3IhyyUJ+XniE+hisJozzuMIZLvbveWVtaIb
 UVB6Ruv3nzaOy0vvCpmxluT3yqhJNcmuytyH+Diu3lctDPlF0ExW2D78OsFv80a3egAg
 DZJl+5qOegqo+agTSCG3FEoZjMbkzKP4mPTknSD142OFCs9wSBThJr0laopBZVxvp81j
 X94fohPuWEfariovfaCC2LfzrKjrswAn7JrHK/wv5COn9N3dEnK7g+VsadVLYWRnRVzn
 gwaQ==
X-Gm-Message-State: AFqh2kp0uBqJtVfj5R3Cn4rPuu0EFF99/U0/QFF7O4BUDEy9AjdgMlDw
 uczN5MySRJuXT7J7efQwMt9T8L7G5OInj7gGDiQ=
X-Google-Smtp-Source: AMrXdXuEEw5I3eSOsMbQSHi0+/aKNKd/x268fi0CyyPSd4STOirnc76W3Yax6EuoT1wwYWWJpoXscZVk2/OpmuJvqGY=
X-Received: by 2002:a0d:e611:0:b0:4ff:b3a2:5962 with SMTP id
 p17-20020a0de611000000b004ffb3a25962mr4859607ywe.111.1675030260733; Sun, 29
 Jan 2023 14:11:00 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 29 Jan 2023 17:10:48 -0500
Message-ID: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
Subject: virtio-sound Google Summer of Code project?
To: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
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

Hi Shreyansh, Gerd, and Laurent,
The last virtio-sound RFC was sent in February last year. It was a
spare time project. Understandably it's hard to complete the whole
thing on weekends, evenings, etc. So I wanted to suggest relaunching
the virtio-sound effort as a Google Summer of Code project.

Google Summer of Code is a 12-week full-time remote work internship.
The intern would be co-mentored by some (or all) of us. The project
goal would be to merge virtio-sound with support for both playback and
capture. Advanced features for multi-channel audio, etc can be stretch
goals.

I haven't looked in detail at the patches from February 2022, so I
don't know the exact state and whether there is enough work remaining
for a 12-week internship. What do you think?

Stefan

