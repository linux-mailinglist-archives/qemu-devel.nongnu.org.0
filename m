Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636245AEFD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 23:24:51 +0100 (CET)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpeDa-0005HE-59
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 17:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpeCZ-0004av-4P
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 17:23:47 -0500
Received: from [2a00:1450:4864:20::32a] (port=51892
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpeCX-0000kb-Hp
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 17:23:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 137so394101wma.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 14:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=0Z34Dc/EMQo3GGsLJj9nS7SJmOi10MatdaESs9ckmVI=;
 b=hZiRLBnqwQeEjmpOZ/v8vb9p05OARcyNCJDcyFUYEholovj0H1umLClq+k24skfVXM
 TgF80ZooOjQSFvFhabNBQ4hti/YXY5KJcWtT0a4bBFKHtiKRo4XB2CLj2X+aFScF9LJM
 WOXGByrXJQUMoAGyfv1dYhZc8+UqLW85IMld3+Y3VEvu7Z9lcKK00qMUo/H0BlzxgIH6
 L/x+lQs/OmiHJ19TlL48C6dDbGR1uBIynQDw4rM1T6emhLUvF4Esa5H+QkUAftnMQbeq
 p+4HXoG4eNYo0Uynyx2RQSZ0a2ipzdOLQQVr76vZukPoVLwH0gFO9A2nqWDas5VpPkJs
 brYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=0Z34Dc/EMQo3GGsLJj9nS7SJmOi10MatdaESs9ckmVI=;
 b=K6RfJD1f1150NidW4o+UXYIrV1+u1mJO1H0MN2n9FKS3604exyh1kxsZoea5mY+E3K
 wdQrmsyOsKe18jTFSzsah1kJgAIGMsD+hoztT8D89pRRLOIjx7nSTKA3Y6eOKnNjpddG
 FzLs8BkE1ra5hrH48dxKke1t1OvJmBoGUibgxATkDB26p0eAk3IyGT26J/TknPcqBlFZ
 HTOvQzSy4EHZj2+rk9e1mpvSwp8JeziKj21uLofPZVQ4ukgbkbd1qG/RjFi2hEaahmkM
 F8tyB0hQWz1v3FyPZ+CUKVDieqRnfIlIz7vN9oXiG3qh0l4sjQo7I/NJugszdqGA/XBm
 qKvg==
X-Gm-Message-State: AOAM531msamcl9hQjeS/H+VwUK6dbEHIm7thyZJ919FAEZUPmRSWpMRl
 o4cAMw8NsOfpxmFm6u/qh77l6hlqxI2X1U/h4wg=
X-Google-Smtp-Source: ABdhPJxEobXQk/IRd7LLfLffjrFzhnaD352FzhbjWBk79i6VOXeIgkp4u9TMDBXv7T8wxJ1W4C6QIg==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr7984702wmk.91.1637706223190; 
 Tue, 23 Nov 2021 14:23:43 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m36sm2882924wms.25.2021.11.23.14.23.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 14:23:42 -0800 (PST)
To: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Delay rc2 until 24 Nov
Message-ID: <ba2e8c4b-5e68-af08-bbe6-fef29d3177d1@linaro.org>
Date: Tue, 23 Nov 2021 23:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I'm going to delay rc2 from tonight until tomorrow.
Hoping for a resolution to the gicv3 issue.

Bear in mind that Thursday, 25 Nov starts the Thanksgiving holiday weekend in the US, so 
I'm officially off until Monday.


r~

