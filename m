Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4C344AEA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:18:28 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONG7-0006Gm-Fn
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOMx2-0003rf-T2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:58:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOMx1-0006bA-3H
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:58:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w3so22138603ejc.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rBBT/4LYc5REdtzJTzKnZXnoGOBHFFQzk+1nJoAJVFQ=;
 b=GIHwpm2w1lxH9Y2sJZTRbf6Jd5pq/SeI52mrXgtWtenprOdSucXphWBsHiC/dFeCW2
 zu5YgZlEnafIfflRS9yOHjApV+BqrRb9znDudtrzNqKJQa1njif27wl/qSmT9b05VKI3
 BJA9QIvkw0zxG35iwClRB6QMwq9jJTNJxAEnMJRTachHj8gG0HztvPmt38A/a0yAmC6c
 ALaiN0xOR6J+zewZf2Li4KFQbK5FuqYkHkid9Xn7MTF8NgvEgpF8ix4l8Y2LwnHY06n+
 1AUFfDIG5Vyu7NUAGk/61811C37BB/pRkQXYYmv728nt4T0O0D7nnohxH3caOcR+FZVR
 aG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rBBT/4LYc5REdtzJTzKnZXnoGOBHFFQzk+1nJoAJVFQ=;
 b=cy1gUZWd+eleQ4U4l8SzmkZbwReuTIDi9HFvq5NDzXR942Cjr0ozLchoYPdqW1M8lZ
 c6nl5oj8GQalM4TXcl5nlWZEQcSviMIeAxpZd6diyQx6BmLluEYD/IZEmi+mAMfaCqbC
 DuIE+M5EMcbPkrOEmAsFY/jBTIabnf7Bnk72UmwMJg7ZrEAiuKoGmCVgGBcvAR9ezN7R
 5kwr2GPVmyv0OJEj0pElQg+Npn93bfKoNCyUcyL5RCSVUMyAOPAzdmRRl38Hq5pCOkcp
 zCgKbCllsh2zY97uPrLqIiR5sQaENioI80AnL5ID04sXSXDboBcFC5UIIeAQeBdbaXom
 Qi2Q==
X-Gm-Message-State: AOAM533tx9ZB7xsP/M8Mq/a22KfHB32LClT9oEEmtg/KpDovRKk7xEOF
 z6qA5x2tGJAfacQHXRcmZL37bQ==
X-Google-Smtp-Source: ABdhPJwcPLsoZ6icbb/ttgAtAxA2ukf4b8Umap6YTUl97Iz8YCsznsLyVsDXbvndEKnc6pY786iLRw==
X-Received: by 2002:a17:906:6bd1:: with SMTP id
 t17mr444711ejs.319.1616428721361; 
 Mon, 22 Mar 2021 08:58:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g20sm11339053edb.7.2021.03.22.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:58:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CB2C1FF7E;
 Mon, 22 Mar 2021 15:58:39 +0000 (GMT)
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-3-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v28 01/23] target/i386: Rename helper_fldt, helper_fstt
Date: Mon, 22 Mar 2021 15:58:34 +0000
In-reply-to: <20210322132800.7470-3-cfontana@suse.de>
Message-ID: <87wntzji34.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Richard Henderson <richard.henderson@linaro.org>
>
> Change the prefix from "helper" to "do".  The former should be
> reserved for those functions that are called from TCG; the latter
> is in use within the file already for those functions that are
> called from the helper functions, adding a "retaddr" argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> Tested-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

