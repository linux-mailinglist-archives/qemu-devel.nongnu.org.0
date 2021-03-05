Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2F32F322
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:49:11 +0100 (CET)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFVe-0002Kw-2l
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEjF-0002WL-GO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:59:09 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEjC-00048e-LP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:59:09 -0500
Received: by mail-wr1-x433.google.com with SMTP id u16so3040296wrt.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=fzt6HC460euBjp4ZddJYbZErp6zcARO1LD1sNexPwvrJ1E8M+cGikJ0++ywIEzPYsx
 jOLKsi/DfYNkaF4CKKe0vbiW5A21/jAxy0fEzO3GtZlx3WAPD4+Zz0mUhEQXO1mIu/hn
 FDYl9+xVcrHtsePgB+USzDnWVsuPSoYBmC7hp2wLbe/y+8TesynT850t4oHYOP1tlCSm
 SsFQVuVd6HzVO6elaPq0l8N6FHXPHbTKqQ8szERPz02ccalLQcftKEBGID9KXmJqG5Rs
 NvJpvLxzkBcJqIAnOupaiij64Cp4Q2DIyGfnGRKXBl3gI31MUEjitytXsZdv6aerIaGn
 Fsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=H+G2qtgIWPm0HIxwOziMXLD1z8uRvmEpH4cw3YQBKUi3ratW7TgmmaSjeh+EJBj0cM
 Avcj8Uzpync/nP5ADnNTL9g83rsFifT09Ekh5yIyfOUYewxs0OH9P2II5WVcx2QBxiB/
 qKy+qpsawt0epqMOavfqKPn0wTVZOAdMOnxxMyOw/xiNcw2nEJnfqOHKBOLpp3uSxX6z
 iqnwt/bsHVbPYlk1jTrQ8K7yvtb2xoK3HTgK5YObkkWJN6+/d5/EzSp/4+PsmYBqmQR7
 ROsMRyUff5WYSQulmitPffTdnaFXNK/sHUNc2oAd1rFSFDWFV3XxaguwvuXAY2B/oI4G
 S9pA==
X-Gm-Message-State: AOAM531bTP5itEPApS75AflFXm7ifkktYiA1Hi+LV5auSIZaLTTbAtKu
 OHEVUp5b1kTymz8zwGgZADBz+g==
X-Google-Smtp-Source: ABdhPJyoAGYis7RLBsP7ocu+DRUNi717tvmSyMmYu+6ugP09Vs9tjxnkJ15OxTWPWSCvbOV+LGtOeQ==
X-Received: by 2002:adf:e809:: with SMTP id o9mr10835267wrm.110.1614967145238; 
 Fri, 05 Mar 2021 09:59:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 1sm5451947wmj.2.2021.03.05.09.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:59:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7520E1FF7E;
 Fri,  5 Mar 2021 17:59:02 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-23-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 22/27] tcg/tci: Merge mov, not and neg operations
Date: Fri, 05 Mar 2021 17:58:58 +0000
In-reply-to: <20210302175741.1079851-23-richard.henderson@linaro.org>
Message-ID: <87k0qlcwih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

