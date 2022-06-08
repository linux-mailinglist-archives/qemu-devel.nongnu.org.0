Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24454380D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:50:27 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxww-00067h-99
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxvS-0004ew-0E
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:48:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxvQ-0006wL-E2
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:48:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q18so17959722pln.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=Qf/zEMFyBf8RQYSQ/ZkZQvTC3M2L/r6z/8b3U/YYt5s=;
 b=RfL/OS3OSj2lDFuvBVFBjAFXNSdcIOdlLsmRdTTs00tZMqlVafkmr3WtaGBQcmRv9C
 Z2Qnz+kmtmIf7H5B8rLgMmJpb1AYhzXI1+tTDV6tsx8EjsjegRXyi3q6q492y7/Tlmek
 fLRwppwSNwn0dHhv2RepplUPHmzJ1e2etK3FQ+Z7j28It8u9SgTEZMDD7EnHDi4ykEB0
 4XBwYp4vvFxqGPFBSMfmbvL7LErQkz/mXOJZ1A12Jixtfy8+Z0x5P7iWD3ABz3ZUc++L
 gpH3b4Q05KLL9noFNkoZvsBTHp39wpOTg/Ve+nlgvKO1m7dhs8xX00ugW1afR/3tkHog
 G7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=Qf/zEMFyBf8RQYSQ/ZkZQvTC3M2L/r6z/8b3U/YYt5s=;
 b=uS6IHRJZtHJIplFga44U2wmc3py2dAX5jLRan4uYN275pSJPndGxdtKWeSmrKS8zI9
 8vP74FT2cmSkdr6TnubDSOTeFHP4odpznvVBfn9X04iRGozwUxWvJuMzlhNKnvRdBb6a
 Fw1JtNrlWQZgcQLWA5O4PwoYZTqu4h+PRNeU67idls+bJb26PMygOiRD/KPqJ/Op329j
 phGwg0eUEfp0cM5o4Nu+kqGV15og861pWbYF8Ja83JhNgLlZxT+MbfrMlpRNBN0Ai/x0
 NVz0Ioyr2tGuOhLtgtR0pIghFxH4sqHtDi3ZTb+wVkm3/hNMAC2iL/Bb8z91ULzQ0Jtp
 /SCg==
X-Gm-Message-State: AOAM533W/6FmT+eo3GSyBMts2Yh9SX+TPowl757Q4tQK52TaFMs5y/xa
 b8zVjRk9l2kfQESRLf2xIAlnOA==
X-Google-Smtp-Source: ABdhPJzZ5xn5Gb8nTr9LXjTctbTP0LlOHpeBAAp+EeNf5+2tx0Jo/LSPk1NPkm/FUmy5qPtY0ZkCow==
X-Received: by 2002:a17:902:f2ca:b0:167:8898:bad0 with SMTP id
 h10-20020a170902f2ca00b001678898bad0mr12493142plc.170.1654703330835; 
 Wed, 08 Jun 2022 08:48:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 187-20020a6204c4000000b0051bc721b838sm13487505pfe.188.2022.06.08.08.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:48:50 -0700 (PDT)
Message-ID: <7909a6e5-3c7c-5859-a1cd-075302fc18f8@linaro.org>
Date: Wed, 8 Jun 2022 08:48:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: gitlab: convert Cirrus jobs to .base_job_template
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FAKE_REPLY_A1=0.384,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Commit 00125414ba1 is not working as intended.  E.g.

https://gitlab.com/rth7680/qemu/-/jobs/2558862885

where I have neither CIRRUS_GITHUB_REPO nor CIRRUS_API_TOKEN set, but the job tries to run 
anyway.  Then fails, predictably, with "token not defined".


r~

