Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325766345D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0yP-0005gu-CL; Mon, 09 Jan 2023 17:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yC-0005f6-RT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:21 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yB-00076O-AE
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:20 -0500
Received: by mail-qt1-x835.google.com with SMTP id bp44so9583533qtb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xQqCQgp8pGVOQEGoSiZ4Q+bXavsqHtzJHPwEDIc9XCc=;
 b=rlt3nmXxXuHt8BJgfNXdR/Y3QEbB2RRWXCGQ8SwEgVagEeLaXLGShJMhc6HurmA9zY
 OSUqnhLWjuC+tssBoP3D32VGW6Ew2wAlmMxJR4BBydLCkIhOpoPojrBr1HklmQm7ygMc
 k4/rvhwr7OdOdpulVJObCYQro4pBYaRvFC1iSpViKGudNFuK9CDniPRydjHaDaflk1WW
 aq9Gow6zjndMWaYQoUAyjyBtwcOCAk7alEAHrRtwtqo5qLIewxHGk5GUDx8QsTfUJd5K
 OeOADc44GXYXQhvsXKrASPD3PvlFyaov2E9iv44ili1Kjpi4EzErc9dcuKVzrN2nkHf8
 qmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xQqCQgp8pGVOQEGoSiZ4Q+bXavsqHtzJHPwEDIc9XCc=;
 b=Nf2Vf9cyspwwq0cNEI8QnhcngMSiZkS7C+Dpxh9IhqV2EpJGecmlmCCtNNYZEQCClB
 qtB8A3FO1ReCl8aaxniFLHVOxZt+jwpmX+po0mzxMeQYP73HxUIvHh/je8OT6mvKJd6n
 GODV0SHzicePOXxkjhjE4fwVagSle+cS12C90kGXO/JYAnUGQTMjy/y8Zh5wbpsu5X/A
 yU6jPnLd5rl/5jg4gpTaLLSpFCaG3bAdbg95QlkUsUlqIYuwzCU4g7bXkKroxbnRh0a0
 +ZBuNzVTKqoSnhsz+mh53JKoMUUROJSZb263xZKu04ASwLM5GLxaVVzjDjZjDnWO8WbK
 VBVQ==
X-Gm-Message-State: AFqh2kqpEBcQ//sQjSZCSlN8w4triiCPQwgc57JEtrew7SangwJQuggl
 xuYDMT6yyY1bI4MgGEd29TJLtmM+Ng0Mgu8KpII=
X-Google-Smtp-Source: AMrXdXsH/7OW+fOItqXtOwW0BMMdTAqIPuqQVod3PnE7sAyRcOoV3Gw71KNvZpCQHF8FhFCfpRTitQ==
X-Received: by 2002:a05:622a:4a8b:b0:3a8:1617:bdac with SMTP id
 fw11-20020a05622a4a8b00b003a81617bdacmr98110057qtb.5.1673304614966; 
 Mon, 09 Jan 2023 14:50:14 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 bp43-20020a05622a1bab00b003a68f5d98c1sm5132802qtb.93.2023.01.09.14.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:50:14 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 0/5] tsan fixes
Date: Mon,  9 Jan 2023 17:49:49 -0500
Message-Id: <20230109224954.161672-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::835;
 envelope-from=cota@braap.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Changes since v1:

- call g_free_rcu on tb_jmp_cache directly, and call
  tcg_exec_unrealizefn after calling cpu_list_remove(cpu)

- add patch to de-const qemu_spin_destroy

- remove wrappers for qht_do_if_first_in_stripe

Thanks,
		Emilio



