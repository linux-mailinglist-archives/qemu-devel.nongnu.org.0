Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C796528F957
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 21:19:07 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT8mI-0008Cn-DZ
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 15:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kT8do-0005Wo-AC
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 15:10:21 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kT8dk-00028Q-WA
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 15:10:19 -0400
Received: by mail-wr1-x443.google.com with SMTP id n18so5001066wrs.5
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=XuqsUv8+oOYMycf5yguwrbKSNpueczwVPsJ2AWaTCLo=;
 b=jmWTm8m20Qi0fzw4eQimYzG4Xid1CIS2xwGJpPzFZ5YXwR9z7ycZdLEqYIX775FhkI
 zYGBdwxamYWcGSy0WhIkYgeC1xsvDIzTiMvWLyB9JkbrJJSgI7g6/5SMeXjT/nKLLRk/
 4n6gh8sARYkma09aiK5IEgRz84RsKSSVXo+7qxxjlom5BbXuSeNQpogQLT2wvEXt0I7Q
 PPg28isO4WMP/OPqZi+M9MrXcyE06G9W/ntKFMSqBsvbi3Qvxjmen3hZ2HplJTKnjmQD
 lXRlg/Vj2ZBk8tB00WXj1T/qoP9fMIEheccmxeFyQ/mQ0EyDIGMzX3tliWVEIEmZAsCY
 93Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=XuqsUv8+oOYMycf5yguwrbKSNpueczwVPsJ2AWaTCLo=;
 b=Z8rgfFoRx1XaMCqsmLaZ3cIsVPQouJ0XMj6ssvxJ5bp4mk2PE52UxbVX5UtW4G8xxS
 ocXG4S68Lhin0F8+lMN7LEkddw3WKBmLGCUUGHabU7U1cH8pke5AzCsrNq3NGwwHqJqI
 4f3081C5ZrsQBmQIhhY1quKDf63cuaal9DtW0ahKfeMQzNnRuqYKvxRlqvfZQZAAJKZZ
 s0VL9qEimgVRPl5b7Y2Op3nG95aeg/GZnjLemY/9BItma1SzqIm2IPyAnVLon6lHd0x1
 BZ6Yarn6GmCsqF7evW/myJMChp2/eX2XGjxQmOyY4wQL+zC9unyGh2aAZZKYqnJu/E/i
 we2A==
X-Gm-Message-State: AOAM5301aRoxzioeAvrv3AJRFUifcB7xw4k+3OulIN4HhaMPYIuLEwLY
 spOPTuH+zy3HCDC0dujzxS/Jlr6z+YoXlg==
X-Google-Smtp-Source: ABdhPJyFdpveWhVFSAtFiQapZqoyvPnqypujVzY+to2rQQiDwOrCQe8TJSDGkSM3HjL3xjatev+ekw==
X-Received: by 2002:adf:9043:: with SMTP id h61mr6090750wrh.237.1602789014710; 
 Thu, 15 Oct 2020 12:10:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e25sm305829wra.71.2020.10.15.12.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:10:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF5391FF7E;
 Thu, 15 Oct 2020 20:10:12 +0100 (BST)
References: <20200925152047.709901-1-richard.henderson@linaro.org>
 <20200925152047.709901-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/10] softfloat: Use int128.h for some operations
In-reply-to: <20200925152047.709901-3-richard.henderson@linaro.org>
Date: Thu, 15 Oct 2020 20:10:12 +0100
Message-ID: <87mu0nwbjf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: bharata@linux.ibm.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use our Int128, which wraps the compiler's __int128_t,
> instead of open-coding left shifts and arithmetic.
> We'd need to extend Int128 to have unsigned operations
> to replace more than these three.
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

