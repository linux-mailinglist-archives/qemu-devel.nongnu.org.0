Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE733896E5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:43:10 +0200 (CEST)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS61-0000xM-4m
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljReT-0002vG-CJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljReQ-0003oE-UA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnivI2uQeL2QZDhjh8ZcXcHW4nXnxn6pAmSf0NzTFpY=;
 b=E9WMNoySLmDA1uHvVHNWH6FPlI+ZVF7qeBVSTmHT728C4gBxgtgJRXMSbdnIvWA9nuxYIG
 D4sEhtD7E4onI02uYtrGWWibB+jxFQxqFVNvdljIKOovXgI2dvYIGu7q2F/KW/RJClePfW
 jvSueNB9rl2I+bcjZkU7/C/CzYUutQg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-NvPpujRXOZGWkR35Qha-Ig-1; Wed, 19 May 2021 15:14:33 -0400
X-MC-Unique: NvPpujRXOZGWkR35Qha-Ig-1
Received: by mail-ua1-f70.google.com with SMTP id
 b8-20020ab026c80000b029020f97f38cfcso5164020uap.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YnivI2uQeL2QZDhjh8ZcXcHW4nXnxn6pAmSf0NzTFpY=;
 b=drcWIhTII3gssExvouBFv7vQ/2r1FaX7a323VnrHhu+5NzC4weazjFA5Y7IGMo9lzz
 auw64fZHRbjphVoxIdOX6hxJiKH01LnkRm0dOQAbFgElMa0TI4Cv4MP1tfnybMNykfqT
 GOikzmiyaMste7fcj/f2piwPxdZynSJGxgpPuQwAU5k9k3y2KhMxv60cCGD3yderaPsr
 xSvwCmFz8cGNv/9jBIfY5XDkOM9RzFWRmk7+m0BnJxBYWbByOfOVbVw96okD3cn8gUMB
 pXsW80vYtCAipu6XmhYcOsyclVpwvgtb1dn0reDH4GUC6xdO3ZeDlnPSkMWt9kIPVgOo
 mQ3g==
X-Gm-Message-State: AOAM532tHLJwTQ29gC82HmIMruNGGkETAgOJIYgJ+rK6hyexrJM19gtp
 RQh4ZsbKHlmBCdep8BznJlAcRI0FLEwrdjYp9BM4Lj62a7aI5CcMeh6VtjxBeu9CUwV4l+JPO4A
 Wh8YRQp6r5wV3uEA1Nh17LfTjKKGzXnk=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr765244vsj.50.1621451672884;
 Wed, 19 May 2021 12:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQUoJqmeHN/HxGn2qbZ8hWLH8JKAPerlmo/Pge+lNN0ha58y5rUCozDQJhhTvuoDLa1y+5LnJMFz9hJv6kzJQ=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr765228vsj.50.1621451672737;
 Wed, 19 May 2021 12:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
In-Reply-To: <20210519184549.2192728-5-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 19 May 2021 16:14:06 -0300
Message-ID: <CAKJDGDadGkony8ru+A_r6ypQvgbhpe56Dns3HUMFChatDADUAw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> If a runner has ccache installed, use it and display statistics
> at the end of the build.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


