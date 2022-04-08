Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9374F98C9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:58:54 +0200 (CEST)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncq4b-0005Pb-7W
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1ncgOo-0003n6-2x
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:39:06 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1ncgOm-0007FT-Kz
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:39:05 -0400
Received: by mail-vk1-xa34.google.com with SMTP id w128so3703344vkd.3
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=5fb8er7pa0mRzKkVg4uMKCClEbYWm7oLGqw02EDYOMc=;
 b=FvF0YDDo0BZ8LjUwf7SF5/HRhU5eLc05J7NMMfWBRSP9q017YlOtr4fmJnHDtyj5I8
 2gZ/3XsIt9+fM5cTeVSrcWVHyrDw5Z5NE8ah7IdEEDi22Nik22Tznpw+o5WjU2E/mJ5p
 QuciPhV00M3AtpsVIi1eglc4Rlki6vuUY+lKgtP4Ez4ocA9MP+46Vf4U5EQs0pbU0xQm
 DHcRXTgjbzQXl+3d1nESSgnQWBeQOaPv9qkW8u+P5F18THuEi8PubH01ZeUCb7CdLWbb
 ubCSTowMPWC9gmH/Om2aZ7d906w2PKdzXwKpZX02Arvcv+EdYcu4mnvbVEul1HMO4WUw
 AYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5fb8er7pa0mRzKkVg4uMKCClEbYWm7oLGqw02EDYOMc=;
 b=S7QtXhGB6QoXQbfQWsJSan+h+vm/4Czv2Cr+xL+udyGcv06ciGtIkyofsdXpcjcOwc
 qQrZSIPi6410IcZTE7xpIUHg139HuY3xdSbeJ+s7VTTC1U+5M5y17qPlUt53QkGZNJJi
 pwUEw5XWOw8kx69hOqJYxiCfl3rEzinS38kndeRHhelvovfTuMDQho1/g8YnV0zRifis
 P4nwSAXdZ//FTaPimbQwQQ1yF09+xrh2Y9K54+j2a+avbBLTmaNu/N5raQurqJgyIwsd
 G9jZl1OYunMASEZWP54weXoa6dufq7BwLTG5iI0qZTG7vWxgX8rD92VKlEHnDW0AKA9Z
 074A==
X-Gm-Message-State: AOAM532+icbyBlkc9BqRoRzYyK6lZ2QU6R7mdwE+b7gtxIRMTE99HmFE
 x0nOFHpa2ETj7rEB0KkxuY2XTp5H9tTqK9kcBj3fy/PDQ+iWjQ==
X-Google-Smtp-Source: ABdhPJxYTB0T58SYhR3QWV7zYGWiYn5ycmfyaxuq/XjwgBMi/PuOX89ZbXjyljj93/hLwcK04A6ZKJiSUWxeQ5iCwdM=
X-Received: by 2002:a1f:a982:0:b0:33e:2d80:4493 with SMTP id
 s124-20020a1fa982000000b0033e2d804493mr6400685vke.37.1649392743252; Thu, 07
 Apr 2022 21:39:03 -0700 (PDT)
MIME-Version: 1.0
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 8 Apr 2022 13:38:52 +0900
Message-ID: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
Subject: Procedures adding new CPUs in sbsa-ref
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Apr 2022 10:23:08 -0400
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

Hi,
I'd like to add a64fx cpu to the sbsa-ref board, if there's a quick and dirty
way of completing that, advice from the  maintainers is greatly appreciated.

Thanks,
Itaru.

