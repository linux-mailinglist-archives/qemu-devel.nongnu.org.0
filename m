Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641C36B750
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:56:28 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4X5-0007Dh-3a
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4VW-0005yY-F9
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:54:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4VU-00012q-R4
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:54:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id q9so2450982wrs.6
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RLTsn04ZOSXF8WjTx0gVRJwjqQt41+A2bQfibgUR+5E=;
 b=WNZNTdOFP/FwJltPqjiPrfbJG3Sdz3AoOHUd4QUJS+sM9axdGvjYyxugbnkYG5Pt8G
 wQFYPTJGjkC3ae8xAaxHE/rr/JE3RrC8K8hsv3VnvtZZWsmA6i5TcV/hfIT3WpgNKJfG
 M4k2/jFWze79R4Wil7Wk0RmWpyW7KEC4FoSDdBiTkwllmBm8zIzu+HtizQeq5Vb3a0tX
 v58/4WD2/Xb2/dDnVs1NUq5LsDS0X6Lre8iMuRW9S3iH7wazvkGR8D1E2nY/E4MXKlBF
 S4KCC3GTL1yKSy6xra6Hh/qsQWYOcc8O9ZDSxkCP331rMsYCz4ArBv4YqD1jqomTawp+
 txZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RLTsn04ZOSXF8WjTx0gVRJwjqQt41+A2bQfibgUR+5E=;
 b=jpuMj8OKmNdSsUw/iK2r8RrLoDhuOGKcc4SsNpytKI7gzxG5m9k4h9RgUxGl65l3RP
 naXtmzTktLMkhUJXcm5vZ238FxkxG16wEbI/1P2EGQ+hx7l2EMgUe8csvcymMtP8ay1B
 /QZQu3rqPSPB/zq+D9KuNybc5kQsutW3ULBM98t5jA0T4cJivRZKE2dEG/35d5Fk80JY
 hmKU8P3Ke/ip7pttvsUPOnZpBHV6XyHNzdVtpNCu4Ryc09B9uhzKBeP0ZUHCCEEjW8U3
 ap04CP/nx/KkYclfWRvQG3VL5tGPIUmQhk5TC6b4c7VuOlOMta+TAFu11hEVN6LXoYxs
 I+1Q==
X-Gm-Message-State: AOAM532R8xkU1eTpGZ3bVG9z1yMY+4oy2GSs0MMHWHtLZzIMYccCy7G2
 UIrY/FJulyxQA22DmwP3MlqpUw==
X-Google-Smtp-Source: ABdhPJzJ3Va1nxPZFRYqSEENXsFnWYf4elkKu53hZQd6mLuMkdYaDO1hZoyZPHXmtSCfcooU2gusyA==
X-Received: by 2002:a5d:4dcb:: with SMTP id f11mr23866971wru.129.1619456087200; 
 Mon, 26 Apr 2021 09:54:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y19sm15481wmj.28.2021.04.26.09.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:54:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C17451FF7E;
 Mon, 26 Apr 2021 17:54:45 +0100 (BST)
References: <20210421140934.7561-1-ma.mandourr@gmail.com>
 <87wnsprnq1.fsf@linaro.org>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 0/2] plugins: Freeing allocated values in hash tables.
Date: Mon, 26 Apr 2021 17:54:32 +0100
In-reply-to: <87wnsprnq1.fsf@linaro.org>
Message-ID: <87tuntrnoq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
>> A hash table made using ``g_hash_table_new`` requires manually
>> freeing any dynamically allocated keys/values. The two patches
>> in this series fixes this issue in hotblocks and hotpages plugins.
>
> Queued to plugins/next, thanks.

Oops, dequeuing and applying v2 ;-)

--=20
Alex Benn=C3=A9e

