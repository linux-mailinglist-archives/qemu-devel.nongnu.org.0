Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95870486A31
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 19:54:08 +0100 (CET)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Xtn-0002hn-8e
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 13:54:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Xr6-0001GZ-Ff
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:51:21 -0500
Received: from [2607:f8b0:4864:20::630] (port=45978
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Xr4-0000i7-0P
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:51:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id s15so3067365plg.12
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e/62iblRkB4oTbgLh0FkcOch+lK4fcYQdXgnlo0so2I=;
 b=PKoS7TKdVx0xzuqE7t1vKsOzlDFoBfwQenCI0D6y3+gAZsqDEIjkIzYgf6hYQqXvXQ
 eKt/cBy1LpJx6w2/eXdHHn2Xgrep7PkRezvvIevnSe6VofOLZ+j8ATzwrAthpDwRufUy
 ga+UnokO1Ob2PCvCKqd+lF68uWIktsHHjJmZAupdIAVeAvvhG5T7IUnJZE//V911vyZR
 Tc8BuHXWY+PS+WyKkgmM9xSAZaC0S4rQGD7upe3Ur5tWffuSbL1yfosVYd4TOTJVDIgx
 olvFjv2cboIqXK66zVy654czh5u6SNwPhJOPIPztoOuW1gx1KZHmpQv4pN21/1U1HNEa
 6UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/62iblRkB4oTbgLh0FkcOch+lK4fcYQdXgnlo0so2I=;
 b=b31EbNIMY2NurKKjfVA9sLy55QFMx5OWoxpWA2inutjUay5OtJtl+ytxJG7wFEs42H
 uzW4eRUn0wLZrKA9zyw6LBj5hxEplbTwWUwfajvkK3RgYz+3mqbuc/hc0/Qh9gRBRpLX
 5oCuw8Ot2kDW8Eid12yYHB481TMfSBxPmK98o75gUVXglGLvStxJ+jTktRJ6hTgG2kbd
 UmRxu9GyGFWCdy+sl81gZAqowyHIHOG8Zi4eAjIUaDhNzpk2C9AS4WETM/f6NRuBK3jo
 Y0LcFl+jJGXk4862A32jpaBhZp/5TFhqTl6Py+mxPKCFrBoLo1fVtW0c6W5Ff/YEJTKp
 mc9w==
X-Gm-Message-State: AOAM533ZclJfsMiPALaqH3zEjBa3ATtb+65EXdtu+kmMJpYnxKsk9IC7
 DH+HVsw+TYHYsFR/I6SMX0d8Sg==
X-Google-Smtp-Source: ABdhPJxa4L0R1lbdcjbr5etBBZn0PxvY89ZhalSur0iWyxEe4rCUHMzJdl9Scg5VS5AuwA0L/9kJLg==
X-Received: by 2002:a17:902:e549:b0:149:22b4:530c with SMTP id
 n9-20020a170902e54900b0014922b4530cmr58139071plf.17.1641495076304; 
 Thu, 06 Jan 2022 10:51:16 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t27sm2446143pgm.52.2022.01.06.10.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 10:51:16 -0800 (PST)
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e76fb218-2677-1f31-829f-f1bd1baeb561@linaro.org>
Date: Thu, 6 Jan 2022 10:51:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, matheus.ferst@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 3:23 AM, Víctor Colombo wrote:
> xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
> removes this instruction as it was not in the final version of v3.0.
> 
> RFC to know if you think this is the correct approach.

Should be fine.  I assume the -cpu power9 that we intend to emulate is 3.0B?

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

