Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AF358166
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:13:07 +0200 (CEST)
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSaw-0007P5-Ll
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSYd-0006AU-EN
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:10:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSYU-0008U8-AM
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:10:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i18so1693947wrm.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r1Trx3GaFcWVydwLUJbDWKQyx6fI42C/1TlK9LRUEkw=;
 b=aNMXzU0pw85qLxOxxM/5/11RRh9FNhyJDXoTG1eM7sq2kv0bpLQyTkPTFgi31xsdRP
 pOSufdIEem4OSbrDayw9NW29IU9FnRweFeY+bSNgCV7+MwzRn5+geGUnRpyFFniu+wg8
 MMfq32OVm7Nl6bAbmuJZ5pR2cBxrWGyaPB33ntjpLw/OoFsPWUtrOfWftRodI5jP55Jo
 EX0oAFFy+HS6lV4gFR0USp8DvdWFpksk/29kCkM4iWJJAI59FcVommFiL0Ylh7qlbM+m
 3Yn8jVowYHth+tAJ5e48hFZkSYhZVpK0IJPSvQn9lDNz+W1VM8HCzvO9INX94i8iyUBG
 pirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r1Trx3GaFcWVydwLUJbDWKQyx6fI42C/1TlK9LRUEkw=;
 b=pE/khRNyN3OyDiZvYMaPs6tkUzgD598UrlEtP2r6q0t12zcyodeITr0df3fYwuTXWM
 GR5uy5wCvoJsxmrblsiHjVyEpe96AO0s8/q6rdd8gWmquwI+IqdnD1JULa6I+XSxYwkw
 7qGTzJHxs9YP/6kg2MqnerJTEyFTB+FAsWYmE3O933x0lOnX6s66qi2z8FYqb6PQ+WGL
 E9E3fHeJJBsbeEY6q1tGYIRsUJx2k71JUvkq5GZZ3kZ9gAxu32xpoah2jlXM+0HisbSS
 MUjNt01IxXukNRGFW1lEkohPCFWeITKPBjNlZe0Vs1qfoCYpS3t/31D6ZhdUIuyclV78
 mTuQ==
X-Gm-Message-State: AOAM532bTDy8KhG77MyyFrn8HTmnl7qO0wngXw3T7N6oNujfmEx+iRNG
 jdXT5QhHcUXfzfREDd8B6jNjQMUpBQbEuw==
X-Google-Smtp-Source: ABdhPJzVkHmuLuEkoN7mlbB8Fame33Ei9Mrlfid8D52LbbrU5fnCAjIwnPR1MCcQ0IfXtoHiGTOOiw==
X-Received: by 2002:a5d:610f:: with SMTP id v15mr10584961wrt.236.1617880231791; 
 Thu, 08 Apr 2021 04:10:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k16sm33753815wro.11.2021.04.08.04.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:10:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61DBB1FF7E;
 Thu,  8 Apr 2021 12:10:30 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 09/12] target/arm: Rename mte_probe1 to mte_probe
Date: Thu, 08 Apr 2021 12:10:21 +0100
In-reply-to: <20210406174031.64299-10-richard.henderson@linaro.org>
Message-ID: <87blapt4k9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For consistency with the mte_check1 + mte_checkN merge
> to mte_check, rename the probe function as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

