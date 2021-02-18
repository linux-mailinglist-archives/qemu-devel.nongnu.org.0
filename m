Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5431F332
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:58:13 +0100 (CET)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtBT-0005ry-QB
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCt9w-0005Pt-6P
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:56:36 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCt9u-00086T-Lu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:56:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id h98so24931wrh.11
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7c+XCiUq72hc/DKK3r8KdpN46jOotTEXNDz6WP+D4MY=;
 b=bgzxiVXcyLT/fJQ6eS6lviVeRH22QVTccfTavNrn+JQ0BAOtdzp2MvX9h2pvv+v29r
 RYP+5WkS0QSG8u/iO3hyci99tADRzULpJzKufx4+MbQ1nMfx770aQiXyrnw+h3ME43bj
 PyeOsAKpK5l+BWGiWoVfQsUzEizZtc9qfomqT9N0Y0mNvCVN6vX8RxEKU5lRN60x29KI
 ne/1PQEfxVCQWznqyy1mvFuuCecwzcx10fcux5Sa6Bb++AiERBuNs+DO80GCQo7EIAg3
 ZKl7KiNpqHPDcakN9ahpxokITS3plxWYnYc0zJGXT8JO/QlIXVVTKEPqZRAmrB5hIRgf
 eykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7c+XCiUq72hc/DKK3r8KdpN46jOotTEXNDz6WP+D4MY=;
 b=uW+QEJvd86wIikC0A/OUYqnUcPXv7Y4Xn/a/pbIW0hy24LKCollknucY6GM3Tu/DGM
 61nh8vyFwK/d+zAPmTUiGb9VNQZGKJUt/4XkawWiE5GscmXepzgTbQCqh5KzhRaWR6wy
 wx6dYJEBL98BxGHJmNDfyufUa8rtPmxx77PfvpKd0sZMwa6j6V9xK2BHzFX5s7msRnzf
 yxi82IGAEMV8kFHNV1asSUQUMnFPBfsPL4JY1+8IMbXT5m49ZhmYG4QrTSPTLklDHyKy
 I2mxBfq1yrmcLCXisal+N8iWIaQ4Iv4LakIiqiAkMvpDNGky2r9oOd9qQSXtdiaPqsR1
 NgEw==
X-Gm-Message-State: AOAM532ub2aj0HBEqWhqJYG7oNfrqjLrfx7seJ06oiM6kPjPORMD0YOG
 hwvKfJA4bjsyThQYilRzcvfTGvd9Cqk=
X-Google-Smtp-Source: ABdhPJzE/+giX9+5unVkteF9kg54izpkgly7ZyX/jG2ngFrUAmrGuwbJ4N5UewpIj6C2x4Avp3ZbjA==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr6507661wrh.76.1613692592853; 
 Thu, 18 Feb 2021 15:56:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 4sm9609303wma.0.2021.02.18.15.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:56:32 -0800 (PST)
Subject: Re: How to get a wiki account?
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BYAPR02MB488605CFFBDA686B2E00640BDE859@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa48784f-4cf9-b300-5715-752662a5be89@amsat.org>
Date: Fri, 19 Feb 2021 00:56:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB488605CFFBDA686B2E00640BDE859@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:23 AM, Taylor Simpson wrote:
> How do I get a wiki account for wiki.qemu.org?  Going forward, I’d like
> to be able to add information about the Hexagon target.

As any user with access to the wiki can create user accounts,
I created yours and will send you your information off-list.

Regards,

Phil.

