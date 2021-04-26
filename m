Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770536B74C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:55:49 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4WS-0005z1-H2
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4Um-0005PZ-Kw
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:54:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4Uk-0000i3-DO
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:54:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id i129so3364670wma.3
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Dg6xEW0D1U83yqE4RP0UcR4OetYcmrmsnmqmCrmR5ZM=;
 b=YUetA+cpwv9X/LaQxaE1CUVKoH63iTXvU0NImh0/dN9qZZ/kR/zwS8PM66NCQerRnd
 ykOIcMospNedNTKfQAllBs/Qnagx7xq0nmYqIsY/e9CQU8NOehP1XSfWSqLos9/r8Tf2
 cM7Xqua4zupsS2NiYi5NnHKvcCJ7CWRyg62wBkRnEIcxdLbhDT25VbdTep6dbykDXbdD
 Ayhey8P3LhVuwSbCqkLYlMkd6dRLsJEvfmbRov0BMKBaIc6BxutxhCp6gP3hg+nsSl9L
 TJRJBsRfUG96CFxj5mbXBdLQJJg7ddtAT85HFQXaC9w4jC1wAb6OqbL+BGrGdgavA/Ub
 4CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Dg6xEW0D1U83yqE4RP0UcR4OetYcmrmsnmqmCrmR5ZM=;
 b=MXLypIkz/Y4lOLp9AEeTQyC0yHkO3zGsZGs10dZxkUe9qv7iA/cn6IA8WNs69XFqTY
 4rWQiD+8V5RrRZw955UA2WhiA5/SIklZ7gTIImYK3DVhhCw1PW3H9fnkaZANKqS5YEaT
 J/h5xnX/wZg5mDVleR5BQenvdAOUteUmxVltTm17F8p3o74DAhFhd+z/2en3UONbgtak
 rpK3ZJNXnWS7VPQBCon9J5YI5QaebORacG/Y/2eoD1gx9WM8IHAtaSvSHddyj62XMWyG
 frTb5CwvCZx6Ol7YF51XFw65RiPXricGUnBuJ2jX/l48rRi2yxp7U7x6sE79cyz9TEZL
 eJ4Q==
X-Gm-Message-State: AOAM532tl7jjH8sXHfWJWxTOBI1lVLGnYHPW3hfNmr4LzK0sK7HLc5MC
 z9UCtbbdGJrKWnVfG258M3V9zQ==
X-Google-Smtp-Source: ABdhPJw/nD6Hlbv38OW/5atmSPmeEZM0kVNft613ne2HI6qsXbPD5sE/HHop3dvRUhw3omPXZeFHEQ==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr25747wmd.60.1619456040450;
 Mon, 26 Apr 2021 09:54:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm805233wrg.80.2021.04.26.09.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:53:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDE951FF7E;
 Mon, 26 Apr 2021 17:53:58 +0100 (BST)
References: <20210421140934.7561-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 0/2] plugins: Freeing allocated values in hash tables.
Date: Mon, 26 Apr 2021 17:53:51 +0100
In-reply-to: <20210421140934.7561-1-ma.mandourr@gmail.com>
Message-ID: <87wnsprnq1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> A hash table made using ``g_hash_table_new`` requires manually
> freeing any dynamically allocated keys/values. The two patches
> in this series fixes this issue in hotblocks and hotpages plugins.

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

