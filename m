Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1852443016
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:16:34 +0100 (CET)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuaX-0002iE-Sy
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhuH5-0001rT-BZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:56:27 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhuH3-0000Zm-4L
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:56:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r8so20625721wra.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fjZTeSRIvtAvxNxamWT3O+b7+vV8ExmKqyqb5QtCluI=;
 b=s1jLAD5kJfNFzbSowq9luP+15kSiENwtXR+XGVczZMv60w0Yo2deJB1lex4ZFm1peW
 0ul4OH5m2xgflFeRvqT+5rAn0qSWU3InavAA6qua0EgJ5DmcQVrVjCskn6iL86GmUjw5
 6fDpkZRROgNkEf5dT+CdbPJ7FnkdUGUwFZX+908CnkpjRWDbiP365VOsp6/ozwJ516K0
 PgdT+EnCVsD6nVjqzwU2SJTi0fPUiZCzPqnGeoYe2aumdWRx+9HI7+HVy99K0ukdmwvU
 MAnbn3AuZwBMYHtXYuG/twPpcVfMrwyeNXgfgYcAlUJpggeb/9Ge4JUX0LHj93Q2DazE
 mHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fjZTeSRIvtAvxNxamWT3O+b7+vV8ExmKqyqb5QtCluI=;
 b=pQ3PXlaR+w/2X77yW4OLMX920p206q7faAyG2LiC5umKuMnRfSoWlHT41Ua8yTVmtE
 5Lj9RuRgbsdCmgPoDDhetq3ztV9mkhs7kNUjySciCPLWmCT3orpukTO/wFEQl1R3c9u3
 kF2LyhSbKOKs5nGkyJOWymmvCBrT6pmKXzAUF7Udb+4cELRbZ+krNnepTCKVk/tGbH0H
 88bFpd2KpNkWsvuvmc8nYpPFvGDnWBea8DlNvfRL1hvIJaM+v0gw6yaqJBAptreh4ieN
 4LrjJwH0qbVOjcg0I/O+uvYWNysFxoy8+6ELpu7F03YlqEOa7hA1IAi2L3LT/NzJlX86
 TJkw==
X-Gm-Message-State: AOAM530wgW5grilvgcE2TXtIa/vrWfJEfCaK3JtOkhVSB/CynQXWQQvx
 3qE0IhmuGhJu1v0YBoRtsokVDg==
X-Google-Smtp-Source: ABdhPJx89Vv5uZ+d5I1TxYAq2zhxJka/J9JgB2PIUoqe7zEcT4vvZ4NzUUdcdMu4rTtNoRjDUALV1A==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr50041458wro.286.1635861383434; 
 Tue, 02 Nov 2021 06:56:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n32sm2823280wms.1.2021.11.02.06.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:56:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F08231FF96;
 Tue,  2 Nov 2021 13:56:21 +0000 (GMT)
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
 <1635760311-20015-27-git-send-email-gaosong@loongson.cn>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH v8 26/29] target/loongarch: 'make check-tcg' support
Date: Tue, 02 Nov 2021 13:56:17 +0000
In-reply-to: <1635760311-20015-27-git-send-email-gaosong@loongson.cn>
Message-ID: <874k8ulkze.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, qemu-devel@nongnu.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, philmd@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Song Gao <gaosong@loongson.cn> writes:

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

