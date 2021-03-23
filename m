Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714F34695B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:56:21 +0100 (CET)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOn8W-0003AU-Co
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOmrQ-0006jE-Kg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:38:40 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOmrO-0007cT-Ri
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:38:40 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so20620243otn.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s+uordGXtKD57HmjWwElVJIoHWlFtYmyKQYWmxTiN5s=;
 b=JldLbGsycSXJiekghfXMw/bXAHUXdJSPj8TtlFgugjVy72a1MObh8lBOxIzNcAL6Nk
 sdkUxx7kHbISu3xJZpIa9Fa/BjRcT8Iq4Dq+ohlDDde5kmheALSh4AuESVMlgKlbwa9D
 Wg0G+8BvtNSkC5uAb26UJAcbFpvsQ01jX9zl3mruEJcI5BkGauH3oGiaXQEC+O5LlB/T
 kvmULEZ1g86M4P9TV4Fo3Y3GzxCtYiV1H2VlSm5Ty3GV40gn1UItw+/o1yePfbsSO9vv
 /ZTkTotdQ3GRmfDn15y0zsr/0K16TdfxQpC8tJZTK7tUzH7fSLuCN3V6XthaLuJ6VvqY
 9iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s+uordGXtKD57HmjWwElVJIoHWlFtYmyKQYWmxTiN5s=;
 b=jbmk0vVqFJZ6dfa8BXyOD+1baEG4JPVExPVZLcLslhJZG+zWMCWWb8o2oMI5Pqpt58
 pP/ODzvy5x0szY4ECLA6IrPSJrE33QAxreE5UjFPUQIkJ3coAalXbFu6raG12Bqwr62I
 vej2TNFzZ2rpQO2bu8uPxX6uKBOaB79CUJia6R1/8E/IA4+x7V+XfwwjcfSgbLi85HqY
 Kye6+62F+/sG9rDo2I3rkYn6jJqAyt3GQ89rco8uOTkYjE/WpjmnBUA9ThYJ/1NGsVjq
 uVuMqX8Bg07a03mWQcUn3y5v5JVKFPTEl4AhmQnmjTVvuuFs8p30ojCGy9VOi2ZpM823
 WsoA==
X-Gm-Message-State: AOAM533752yW4XQIyFpPHy7NdstKtF/6ynXiCdqpQXZ4cjo/4erKMJIV
 zaebQznUoQ2Pb52bmqpjHJNX5g==
X-Google-Smtp-Source: ABdhPJxlPYX7u6UrABuvTp6Oc5wo837bzIKSXfguICWoaM02V6ZEbZQ8rP5zsOxMbKqLATCWzpBzsA==
X-Received: by 2002:a05:6830:408a:: with SMTP id
 x10mr5733274ott.248.1616528317421; 
 Tue, 23 Mar 2021 12:38:37 -0700 (PDT)
Received: from [192.168.103.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id e82sm3951756oob.37.2021.03.23.12.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:38:36 -0700 (PDT)
Subject: Re: [RFC v10 00/49] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210322140206.9513-1-cfontana@suse.de>
 <87k0pxiu7n.fsf@linaro.org> <f57c1550-e58d-a401-18b4-3143e99f4cce@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b0f32f34-c49c-ef4d-18e5-9b8ef80ce34a@linaro.org>
Date: Tue, 23 Mar 2021 13:38:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f57c1550-e58d-a401-18b4-3143e99f4cce@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 1:20 PM, Claudio Fontana wrote:
>> Also I did a number of different builds:
>>
>>     fdfind -0 -t x qemu-system-aarch64 | xargs -0 ls -lh
>>    -rwxrwxr-x 1 alex alex 129M Mar 23 18:09 all/qemu-system-aarch64
>>    -rwxrwxr-x 1 alex alex  64M Mar 23 18:16 disable.all/qemu-system-aarch64
>>    -rwxrwxr-x 1 alex alex  81M Mar 23 18:20 disable.defaults/qemu-system-aarch64
>>    -rwxrwxr-x 1 alex alex  94M Mar 23 18:12 disable.tcg/qemu-system-aarch64
> 
> Interesting, I did not think to check these numbers (anymore, I was at Huawei times).
> It is still quite a large size.

File size is only somewhat interesting, since I assume this includes debug 
info.  Using the size tool is better, to see the real runtime code+data size.


r~

