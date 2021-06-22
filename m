Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC953B0D9C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:25:04 +0200 (CEST)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvm19-0003Qc-LA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm0J-0002kY-Mq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm0E-0001LK-3C
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624389844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cq+Zll/YgAmKMz/sCIfJk+Xw2HT0g6hFthoGRF0x9uI=;
 b=RmOtsTz1iOFe5PeNBUis2lXf7EuF1HX+sCQqZE3mlKYGV6dKBez0zm5kVwt982gWGP/RlJ
 DWnNybTkXPurwoxtgf0b0MDnsuq1mdNrjvfF+4jo99crQIpLl6A5G0RJog7kOjcyml7ODI
 TwErlGYP0ZFpXFKK3wRPJecOdFdNrb4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-BOm48gWeMZWcp5jLPBgrdg-1; Tue, 22 Jun 2021 15:24:02 -0400
X-MC-Unique: BOm48gWeMZWcp5jLPBgrdg-1
Received: by mail-ua1-f71.google.com with SMTP id
 80-20020ab004560000b0290278962332aeso4705908uav.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cq+Zll/YgAmKMz/sCIfJk+Xw2HT0g6hFthoGRF0x9uI=;
 b=kgVpvY7puiWrnGtjIo8+K8VYMZHgtfAxk+SIZh4k9++tUMO+lcdFZpM+JhwgpypW4/
 hdw9aCNQJVcXGJNz9TLdUH3XrMrZjEgtTcUPJZJTUxqhrLQJSHq6YjR8sqdaDPRnP8LA
 h75fmuCm6qGOtRUz7xvB0Ofvb7QemGPEx4w2Ay+ZkOSOxted65VzYqziTKu0FgtdY/hC
 VQ4otCXmL9bVy0TswCltHwZxYHWG7mhaVES1BL3orHBJlswODPryfLdsLRTVWeFslVxI
 NF+ccoK/UVTS8OwIzbSiivdkjA98n0QSFFPelaKAjiPXO9QoAZw+BB1YvFWxJpyY8uCh
 QYDw==
X-Gm-Message-State: AOAM530x+LqnleIkRYQVl4lNta5APOpQfa2tyvfZ07Ivc4OfTksPDm/p
 oNGbxKal0XjbWWEziIYGzBSvPEf1d0vYamegHx+RhKJM/eHHV4sRE1XVuoNjSYy2SmZC7LjyMBM
 JosFLCxT1rv/L0qtbFnSXDMjNVIqEb+Q=
X-Received: by 2002:ab0:6199:: with SMTP id h25mr493674uan.113.1624389842217; 
 Tue, 22 Jun 2021 12:24:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi9KP/9JQ9/PinUb6tmcO+t0WvBNAtJWdrBGQma0ld9K3hlnCkNfyGPzmvYqETEIUmQWdBFtEuo3aFZf1W28U=
X-Received: by 2002:ab0:6199:: with SMTP id h25mr493646uan.113.1624389842008; 
 Tue, 22 Jun 2021 12:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332429407.194926.5057230329979093589.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332429407.194926.5057230329979093589.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 16:23:36 -0300
Message-ID: <CAKJDGDYyz_-FokW+UzNEwhx4mBXrmH0xvgvoTkCc2Ht_K_p1Tw@mail.gmail.com>
Subject: Re: [PATCH 2/6] tests/acceptance: add replay kernel test for ppc64
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on ppc64 platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/boot_linux_console.py |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

This is already upstream, right? b52d7e216c6 or am I missing something?


