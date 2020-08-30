Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD52257090
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 22:44:47 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCUBx-0002qA-Lf
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 16:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCUB4-0002PT-8b
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:43:50 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCUB2-0004NH-G3
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:43:49 -0400
Received: by mail-pj1-x1041.google.com with SMTP id q1so1937043pjd.1
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NqM/l54/rec+NbGIQpDwRgR4o2qE3atkIZamGRLNtX0=;
 b=RK8BX3mw0JXHCcOUOqwTzFZ9BAIwLAnOnbS4NufZ8K7dEIh5BuWcgaXuVoNLClQEp+
 nJTQLDYd+BHg9LKnK7W07bBV1tdPuV4MYeQoLTEwfrwR5D0e+ECLPNzkaMU02jW5Yl6S
 ClvHF6/0+o7DkBHqxQ+2F6pZmEpmUGl+6H5zqHeXhmg77UJKH9Xd2QeCloUzdK5R+FAz
 s7n3RNfXd01yix1CJu261FnVH1KdS8peFHGKSZVutyxEkpHyJrdhJDNv+IkhIzzU+YwG
 JzX7a1fbHs+sparyieatdhYR6u/bTn/Qw+uqPLWRd2r/pVuBQuh9an5xw2TAkQ8oKuT+
 x6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqM/l54/rec+NbGIQpDwRgR4o2qE3atkIZamGRLNtX0=;
 b=o/CjK0VIqj3LGQoRG0M/2IVXwa4gnHrHIMvVdCXGyZBD7bpt9H4pya09l+JXejT/sQ
 LTa6RZVAvEd902P7hgrdgH+BsKWMkGrs0AqKAGPCVN9QnIzA8PouVt68bK/8Em1YwmTq
 6/8TDAcS6FgrAEW1N3XAAgkQ+9G3GDm7MQYCx7uUDy1ziKeYJ2M7ajvkTK5m1drHkUm6
 Ih/l5aE81IoGGMFMYN7+JEkoAqFECkAHq2ZO6B55/diXvkXiwi9VMVEhp3AeuTAZANGi
 sUdZ++nXioYay5h1PCP6GZYeMOuLyeqgsWhYkqjLin+nqXE2cuq9K+QyWt/sJ4ypVAxN
 Ayow==
X-Gm-Message-State: AOAM530sQEmAoiIEz26MErZ7LuFB19leqHa5/e1dfCOBR2h3werenN8k
 toVAu6ByuKt3O0kp5zG1Ic9QmQ==
X-Google-Smtp-Source: ABdhPJyIcqGkjxriXR8idad0P+Jr/vJnmEEmtj2dGYe4LRljOsI5HmT5sQpgUP4BKaPixovL+vhXqA==
X-Received: by 2002:a17:902:7083:: with SMTP id
 z3mr6198534plk.187.1598820226766; 
 Sun, 30 Aug 2020 13:43:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b185sm5453760pfg.71.2020.08.30.13.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 13:43:46 -0700 (PDT)
Subject: Re: [RFC PATCH v3 27/34] Hexagon (target/hexagon) instruction classes
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-28-git-send-email-tsimpson@quicinc.com>
 <e360439e-7d6b-72eb-e5dd-026623e498b5@linaro.org>
 <BYAPR02MB4886388669CF07A410A251DCDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <662f8611-7762-a243-14ed-d8afb0b53629@linaro.org>
Date: Sun, 30 Aug 2020 13:43:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886388669CF07A410A251DCDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.207,
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
Cc: "ale@rev.ng" <ale@rev.ng>, "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "aleksandar.m.mail@gmail.com" <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/20 1:04 PM, Taylor Simpson wrote:
> So, this should be CamelCase?  I should be able to fix all of them.

Yes, they should.  Thanks.


r~

