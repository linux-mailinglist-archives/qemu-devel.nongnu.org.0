Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829175E5442
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 22:12:52 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob65T-00040f-Cn
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 16:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob62c-0000wS-7l
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:09:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob62a-0004x8-KX
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:09:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id s14so9923164wro.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=nnMQaUJgGDfQ0HBu7DMpicGUrb8sXKnj46LJ/bxnTDc=;
 b=AU0OEEqYcIqCrgH6COhhE7F+wcMADIQEZn8Ozt11sfzTR8QqFaElOVbgPYiIo6tW7q
 AyvBcBc5BsFsxpw3GglNyMbPDxv/kIst4EEZbW7imY6h4kXx3jvlQn3aacwtTTkyG9et
 /4jPpackutnkA0zBfXU8UtsECK9vpmmgWk3wY/UZoxthnN5knlWou0LJzRPQyjyV0nZR
 eElTPTY0P+YZylTJUQ56xNtmmWgOzhnsNeKWbXupuqRE9x1ZMJhpLTY8ZqDIXWVTvB7P
 4WjWHyYuPTJdmhWUxTPaxUMtg3S3C2GmAvsMUWLxNA5j49QCjBhsvsuKNTHKMepOifAm
 rD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=nnMQaUJgGDfQ0HBu7DMpicGUrb8sXKnj46LJ/bxnTDc=;
 b=rCo16BiOZNn2ZzR72kObOYuzbBGt8SmeK6KOv9RYHjrPH7hy5F+Uawymu7A+7SLZbg
 gWizjcr005R5QZiQiKrTJxTu4Td8wXH00w3H3EECZX9latQPjqKoLcLeZl+0pYJobge1
 RYqRJifj/okQs0fzgj7nH0jQlUCrKW88luHFHgJcjL22ApxSWMF1i816cGG+PAjhiC5Q
 fUu1Kzobpj0Vnm2GIpIvUXLMGZ4GpQpVUA91K8i/nK8cYLMp3ZvYgul6GZlL5RJkuXau
 oxy8dRLaVaNLk/MsKbJ3rAZC/0uyuZ57jFbmdjYmlT7NqBVjAluL6LZln32HHao8wdb0
 bAwQ==
X-Gm-Message-State: ACrzQf0BMWTQgjsywoVMehSbvQ49iE1IYKl9d1nuaFYLfAPeiFtEMXtZ
 uICZSCqZD2VN3VWa9oAGa7LmIA==
X-Google-Smtp-Source: AMsMyM68lAMPBm5D+1utKqtxbuoYKo2XgTFhqQDSHNq34hoAptDFOcq2XeBmRFJsDTrPH1XRF/VkTw==
X-Received: by 2002:a05:6000:1d93:b0:22a:3318:860d with SMTP id
 bk19-20020a0560001d9300b0022a3318860dmr18301025wrb.352.1663790990995; 
 Wed, 21 Sep 2022 13:09:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b00226dfac0149sm3306997wrs.114.2022.09.21.13.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 13:09:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB2BF1FFB7;
 Wed, 21 Sep 2022 21:09:49 +0100 (BST)
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <20220906091126.298041-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/7] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Wed, 21 Sep 2022 21:09:27 +0100
In-reply-to: <20220906091126.298041-3-richard.henderson@linaro.org>
Message-ID: <87edw45w1e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use the pc coming from db->pc_first rather than the TB.
>
> Use the cached host_addr rather than re-computing for the
> first page.  We still need a separate lookup for the second
> page because it won't be computed for DisasContextBase until
> the translator actually performs a read from the page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

