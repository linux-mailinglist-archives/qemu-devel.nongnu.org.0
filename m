Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B82DA201
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:53:48 +0100 (CET)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouqq-0001ZI-1G
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1koumN-00051W-5a
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1koumH-0001Rx-Dn
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607978942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fnAwXXsru3ShE/0H01SgjmoGHdaa1SQ1M7ZoQ9W51L4=;
 b=OWenLMkdgsdMJfOAp/gZbXzxvzxDu0k32mhdEqUHqZS+FSkRZv43LTbSCNIw1YtRqdUNb+
 pcqJ3BrkR6QGDLHJ2wo/WxC34dqET3feGRQk3zJaHZw0/DFyYU5iJ590NnZeBHdDYxB6ou
 0PogUQcHD7NyCwfMvOCoquC4+HavmQM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Gy8t8FDiPWWZXk0DhJHYpw-1; Mon, 14 Dec 2020 15:49:01 -0500
X-MC-Unique: Gy8t8FDiPWWZXk0DhJHYpw-1
Received: by mail-vk1-f197.google.com with SMTP id f139so7669442vke.23
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnAwXXsru3ShE/0H01SgjmoGHdaa1SQ1M7ZoQ9W51L4=;
 b=rbGMms3Z6C+bgYF3ISeQEMjMfhFFj4Jt/4e7KTTI75VKknWSyeFjBD+Zv4jN3wyBLF
 LLKhzu6yHS/ipmj4+wdm3e4hxwwnHw+UoDVB54O0EXxhQLXWtbirwxT8YoZoiG85cotB
 6FfgiknDy1ti/1+sDlhzE00bebyufoDU5elYNjpMdHWYdn11Yw/+yK0BT4Bd4jUwz1q2
 teycG9LyDiLkujxTnlrcxvpkVjfJcsMNn/UXdN029dm5d6GR1GzbYoyt8wJ6N/ioQkCF
 X//6zyxm/apGulQ8ojYl2T/gCzlxapoZsn2HJDzQuBaAPaHE006TE/AEKUHSezpekXWl
 KhVQ==
X-Gm-Message-State: AOAM53056WTyqPXy0HHpPFK+hxAWh9Tn3cov3Qy6p88wUSFYxZx7PJR7
 xNHOln7M9e5YAnzWJSrQeSPpnWQcIa59OVfFb3JTWRiLS7q9zt5MKXVIV/YGraTdnYdSTJ0KI21
 PWE0jDiKD5XVlrvOIH8wGbj9lQ5HJQ18=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr27141926vky.1.1607978940010; 
 Mon, 14 Dec 2020 12:49:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqUIQCBxuUmTF2s8xBsWj6ZvMw3W6tSmZcCWT9w8ji3elRfmKwYvKzQ0ERRFIY9TM1vILzh9UsH6qFfQwtKGo=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr27141917vky.1.1607978939819; 
 Mon, 14 Dec 2020 12:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20201211183827.915232-1-wainersm@redhat.com>
 <20201211183827.915232-2-wainersm@redhat.com>
In-Reply-To: <20201211183827.915232-2-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 14 Dec 2020 17:48:49 -0300
Message-ID: <CAKJDGDYqsKDyiEXe48N=P+vuqhB6fB3S6ToCo2mxuk214Poq6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] tests/acceptance: Bump avocado requirements to 83.0
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 3:38 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> To use Avocado's testlogs plug-in on CI it is required to use
> its 83.0 or greater version.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


