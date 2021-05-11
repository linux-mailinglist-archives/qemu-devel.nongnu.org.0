Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B086237A5DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:37:01 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQhA-0003lb-Rq
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQdI-0007uF-Iz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:33:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQdH-0007KI-2z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:33:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so19782911wrx.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=XHB29/KoZrcfE8NLrHX8B9gKca6iYFOce+QXPzkdoP5Vnkf8P6sQCYFvL+cKX83N/F
 BD4WyJ9AJwBS/cHI4orfsuj9KMGuL2qZglIh5Akklk+cEQNaZcIX5ibi2X54p83SeEiF
 D2bT9O9k+8eLNbQLodtWC+2XqGymetUkJsWk52VG5PQ2M9wGUSpxUbfO5tgNu+ESvfkx
 3gmzdTPJr1g2o9iEb0QjZdAUibR1JUxqYFHmasUnwkEkheNQYQGwVMCHxYS7785AGgog
 rlzS0X8AwKCPGJxQtzQ7Hxc6Lb0I3YQjXR/PB8prlt0OEDCBlPzNdsTdIgilcjkOqNB/
 TvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=hbUnbBDBMbDpcbfYbAcKILG6+MP5IJj9qujTh5Pm0aTbE+1g3i2sAixnvohahfen6j
 v1lCITy8pfpPb8w22Ig1qHOhuMmjMpKpd3Ne5HEhHLUhOaMT+tZhQRWQ0/UbBZRITs6C
 D0G7xtVYW4u3cWAGU2PttY5OV32EtOLDJFSh3iSiul/DB+hs3ChsfII4yNyG8gA78zr6
 1mrWEu2074v3LlGuw7uHzD0CpaAuLaBsTAt/foSCrw6XpHdqQZnEMRWmA9zer0aJUjaQ
 z9BNAONfFhByJmOKaVilkuzhVROww/pcPHThvCvWmHuXP6R81yyimfnXlVdsIKdMnQ3p
 KGZQ==
X-Gm-Message-State: AOAM533lfEJiNbaZWEiOKSr+7BxjzxPJbl8SJbS/5MCXCP3vztoxGzac
 QVOUfqzbGCaveb1KbK8DfXxh+iAwb7beUA==
X-Google-Smtp-Source: ABdhPJx4D418Iwxktq9RyebGI4pJOwe71UlxtutblyFOL1QAyyWYl6NLkJrQdvczzeeqvXsjl+j8RQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr38029343wrr.218.1620732777681; 
 Tue, 11 May 2021 04:32:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm3177792wmj.7.2021.05.11.04.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 04:32:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEEED1FF7E;
 Tue, 11 May 2021 12:32:55 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 21/72] softfloat: Use pointers with ftype_pack_raw
Date: Tue, 11 May 2021 12:32:51 +0100
In-reply-to: <20210508014802.892561-22-richard.henderson@linaro.org>
Message-ID: <87h7j9jyjc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

