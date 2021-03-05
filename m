Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352E32F28D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:30:40 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFDi-00016j-TP
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEcR-0000w3-RY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:52:07 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEcQ-00023t-9N
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:52:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k66so2202552wmf.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uUSSFo3k8yEBRzLSq2DbSr3tCwdNh3N8jwMz7Nxi+DU=;
 b=hsKoCCKiX5CiNFFmaDKSnYmoKK8h35KeB5NdtZo8AY2Ram8R10aK3l3+lHsdLiY23w
 c+0AXJn/IQwzy+wez6HEIZeJo6y4ys28pIy8fnCvLdyPhGsiVrQF9XpqHExS/5QlXiix
 Nt4TpQVvWk/nimhnqZxriPMm6nAft3+ocJtJhQbrlZvICiFtUxiV/9odZ75n1sLEdD34
 AzzS3jCNWIZkhx6gOlcWvZC96sWdgvOr0TVpVsI9TxFmOg1gICb0utoJVWH5hbHAHoPG
 NKKvC3KlpqEXbBpNJxRqT3sBwAlTgEVq5K0XJAM0HTjMW2nRrza0Zbto69N3fue5oGCY
 EMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uUSSFo3k8yEBRzLSq2DbSr3tCwdNh3N8jwMz7Nxi+DU=;
 b=sHc2CnOK2ReXGX1wK5nAmqFmaSOF53vhFzicS+K/Iaqti0wU3nO5s8Qqfqsj1vSCJ5
 LasHVlZkFxAxKJp8C76Kigl5R81cqaBQ2/NEJyfdieaz2xdLNDg9uRBi8LWlv1RskWGE
 SoS++ZeaH/4tcre14hdB3/kxjs86iVue0BmCbOUJPfvux7BSMxkzxdkcsXws6uJnaSoF
 2mUx2QGVCTAy8EZvsG/9TOfpoTq3SqILD9m59G/iQYzuFrtDA9OAeN8pDufZlNCYRg9E
 hYINri037IJYk8+J+hWQBRKsoBzexj1seAZBfTS49GTa/1iZwfofyvCQO67g5V5hU6na
 g7kg==
X-Gm-Message-State: AOAM530SWw684PHprlwMt1k9Cz11o9tQCn/6oJavtlhu17FEGFmstD+c
 +6jkjDhBQchGZUMMocsQwWzSUA==
X-Google-Smtp-Source: ABdhPJz8ElKr4QWzQ+4D64Ka6vmzyhcklGxNSLU6//KM8PHTtvskr7BCKjZ9vtPIh4XXUq3ImavcDA==
X-Received: by 2002:a1c:9a47:: with SMTP id c68mr9828597wme.63.1614966724502; 
 Fri, 05 Mar 2021 09:52:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm5672622wme.9.2021.03.05.09.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:52:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 809B51FF92;
 Fri,  5 Mar 2021 17:51:56 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-18-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 17/27] tcg/tci: Remove tci_read_r32s
Date: Fri, 05 Mar 2021 17:51:51 +0000
In-reply-to: <20210302175741.1079851-18-richard.henderson@linaro.org>
Message-ID: <87y2f1cwub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Use explicit casts for ext32s opcodes.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

