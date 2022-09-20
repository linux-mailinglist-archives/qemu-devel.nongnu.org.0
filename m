Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3D5BED49
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:03:19 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiWb-0000BV-JP
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeCD-0004Br-1Y
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:25:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeC9-0005Yh-D2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:25:55 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a26so6618742ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=j8a2Q2kCKajrPYDnxbIr5HJoJ/UAyVTuqI+zyphFleY=;
 b=PE4oRsn76QpbhndK6BpsfKiNFiTuP8PsylLIvSAPEj4zq33kbYy6oHh1GuTgNU4XpV
 5+dus/+VllgNowZNeh5a52sT0tykq/fbZZyprMEq2qBuYrb8xFVzzOUcqkX6e6naoFS6
 45/b1HlYWoo7cgCTUeHNCOi8FMBTYxiNYfTEbbNKKiOVb30nnUisd4pa/V7qQARkiQL7
 tMEoyIGEtUi9UuBVMZGMqRJAqgnhVZuWqvYCjHXq4LgnGVj5sE33xmngKNpMplezxvFU
 oKthkiM4RmfSSBG5W59adH5mup6ddRctHWaabeGpoukK2wMPZUlu0EaDSZKlnN8FfkU5
 A3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j8a2Q2kCKajrPYDnxbIr5HJoJ/UAyVTuqI+zyphFleY=;
 b=2MrIlnUqreIXF2H56mlY5dymDBBLH3a7nOpjd1aTRvIFcivBjPk2vwzW3oN8sXhNoL
 t3pHrqgdUm/6rExuGWDit4AVcV2U4pnk1Fjx/K/0GxlzPUxmhqrJRYydA1D/CVQRqgFV
 N5Fa9M2tmoy34LjbD3Yf1UoGDqOz+VLpF5gDIVoMgrXZgUHwvxJUNADYXaMd6YTeJNzM
 gauT2Sa+KRqziQGlX+Gi383i+Oe8raZV7YndP0Hyt1Zlq4z6eZzO/Az45MhVbFew2iyR
 eESslbBFpwtvbiVZkfsnSAf8r9igivI5p9JxuSqDFpelLURbqwjNR8flCQQDbknqrImc
 wIfA==
X-Gm-Message-State: ACrzQf1xlaGssIBK8Qk5z3Aq72nXAwbNgTtiEthpEHiiFD6+XWAzhuNU
 5ukStqrfYExh6vxUNRWQwxloB080IGjoaQ598X9ObQ==
X-Google-Smtp-Source: AMsMyM7z21yDhyjpAXDTWy+jkR/BCoaZMg9Nl2o3HWR9Z8GRNQV7rxs091oQU2F1gGBSX7XiURZw770sJWxMTBrUKIg=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16441679ejc.504.1663683951651; Tue, 20
 Sep 2022 07:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-6-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:25:38 +0100
Message-ID: <CAFEAcA-LT6V6=7-J7FD6_RLB4tw3e+OFXqMxe-AuO_84VEbgJQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_v5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 22 Aug 2022 at 16:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

