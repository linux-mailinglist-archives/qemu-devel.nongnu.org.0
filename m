Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD43697FC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:09:57 +0200 (CEST)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzJU-0005E8-AQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzG7-0002tS-7g
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzG5-0001kx-TA
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619197585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+tji9J83VF01E0l82iMrMQc+X0rEqP/eB9Gm5ExwlOo=;
 b=g7Zkn9+pTk7FY5DIMLwHAX+T36V/gSQYwlI3VFZUWyKgepRoF3ulZaW3ZV3YPbYHhPP102
 loM7ziI1PSpWQd1sWd+nP+AeXPRyYFTInpJIUxYFpXZojXri4mDq8Y+h7tQL6ZhZaOiEhD
 omy2PACd3hhS6VCa8YduyrKOHaOarac=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-XjArojYDNKyhYbrJmC335Q-1; Fri, 23 Apr 2021 13:06:23 -0400
X-MC-Unique: XjArojYDNKyhYbrJmC335Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 w62-20020a1f30410000b02901cf4520924fso8460680vkw.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tji9J83VF01E0l82iMrMQc+X0rEqP/eB9Gm5ExwlOo=;
 b=L/k9lWOgKFTj1v94LTesZ4bWlRHYgPnDtP8Ib5dBAUpPqJUKFXs0SuB2kPTK3xjAhE
 ka3NwonBoLMc281ZmdiB8i9LiPoebGXwyCnuU3xBk0yxR18BzfSx9JKzxLV5bkowMrrx
 EdjrmYlD6a4vQkaDQh/gtEYS9x+nYmxSIF7OGg3eXbLdOI/TYfBiDJ1Fp5nH1H+Wc+26
 Tcf+zGX/m13jBx+CUpMvZDM7fBu0D/EuLSjJcBVlrHarYDyECE+gifM0OkEZ9TG7htsM
 RR6KGzJxiQYp24o0y+K+DYqUh1t24v56j1oMEEiOSXYj3+o3EmXGYv2c/smD14Gyntvv
 KsFg==
X-Gm-Message-State: AOAM531B/f6skM/GZSMNUCHtTO1GTEGvohpHeVgAzz19YqRPscsw7uFc
 E/zYxOzEed+WdVbIkam5tdKwxaDCe5OtsLxYZALlHBAj6E2SEjym8DhELTCGWN6DHVUhaqRwT2Z
 eBzCe6nsDVR3rCltux8cQ8RgI9uYGkks=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr4769833vsn.39.1619197582176; 
 Fri, 23 Apr 2021 10:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG2q+EHr6lZIZhqCXZifWcEk4iLT56WZSddkQEw+ma8CZcpdy8b8h5Zd604n5oBVy6VuNtC23EBRNwxQYnX+w=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr4769809vsn.39.1619197582039; 
 Fri, 23 Apr 2021 10:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-6-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-6-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:05:55 -0300
Message-ID: <CAKJDGDYfcpqp4gBrVNABc5T3z4azKHrAAkScJtwBSkxJGbZxpw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] python/qemu: Add args property to the QEMUMachine
 class
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 5:00 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> This added the args property to QEMUMachine so that users of the class
> can access and handle the list of arguments to be given to the QEMU
> binary.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  python/qemu/machine.py | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


