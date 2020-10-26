Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C374A29937B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:13:33 +0100 (CET)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX63o-0000kF-RN
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX60K-0005Ia-1k
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:09:57 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX60G-000700-RZ
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:09:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id j7so13491146wrt.9
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=A3cvVT79n3JsZfAXZXtD6kWKJfj8sCr2NWHDwhO+tks=;
 b=D23ejDbDao6xMERec7njSeyeBo0HT1ZzRcQwEXKoxiFfJbaB8YCZkc/eXhGG8bpMAK
 17mrSGGoy8T/8mo9DDVEdo8FY6mK4tTxBFhqRbj+OxFHmVobBSTg5fNySYRzGkIFu8PF
 /DMsfHjgNGD6VNdltmQSO3rpss909mIiRbsXR8Zaz/K3yY/iZ/ytNBkPCI7McjI2BC5+
 bwP4S99W1VNMnmt9WhWm2qW392jRpSLnvEnTBroT/vV1z9QEm59a44IEWPnOJCL3LX/j
 R7rGGPBsdaJ3Ziyo+d4DiA3/tthdbz+G73CnYr3HoMmF7V6LeIBs//aBYMJXrXcAHIRm
 itDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=A3cvVT79n3JsZfAXZXtD6kWKJfj8sCr2NWHDwhO+tks=;
 b=jhJ1JH0oA/Jzd8E+zBaWvVdu6bnisYzDoL0X8w46CxVN6R+kjQkK2IhPYttNrdIGsR
 /lwAOiQhxRnBqpiopxW3fCaaLJY7+0MeKXNWIPLKz3WPVelh/d2pqu2SO2PNuILHMKvz
 SJHzhGth8oe8xAOe9VEtuhOkVquKNbeYFFGnBKmxNwqBbbg/jXmdS5DhmXVmlTgrqcME
 wAFm6hRZrzwNWlo+SIfiXBDv3ZKK5iXjlAY/lpQTaqqD/AXVbrGY4OUpxeN46+UfgazP
 q5Msd/Htn9sCnHyAcOpS1RQQYE/9xvC2obndEB/IORIkoV7nFsqTsIZWlc2jvFFMgeFV
 GO4A==
X-Gm-Message-State: AOAM530qBy5+USh5WPaSUKcIV1JMhGEpGT9Q+5WfIKVtdT1idnvew7K4
 b5NDB/XCADSdssIjNfi/UMMcQg==
X-Google-Smtp-Source: ABdhPJzSyZI/jFTPQ8kyaXSaUHMfY8iThTDIOsyV9JCIiwXmF/KqW5Mz0y/ij3bLhdWxvjMumj/f+g==
X-Received: by 2002:adf:a50e:: with SMTP id i14mr19199835wrb.121.1603732190599; 
 Mon, 26 Oct 2020 10:09:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k16sm20444673wmi.5.2020.10.26.10.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:09:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B6B31FF7E;
 Mon, 26 Oct 2020 17:09:48 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-2-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/15] alpha: remove bios_name
In-reply-to: <20201026143028.3034018-2-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:09:48 +0000
Message-ID: <87blgohq1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: philmd@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

