Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB33D6796
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:41:18 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86TV-0005Vk-5o
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86Rk-0004Pq-Rg
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m86Rg-000498-OS
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627328360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJx35XuZAWVlSopQDH4mRLA4sjpcCWF4AZmUKVWvW9I=;
 b=fJ+PL946gAYY9CGbG+KO3QAv/uXP5GmfWlUIPcms/RucDi2S3UyXnUXPf6NsIEiUHkA+VU
 /VQgDu7iQMjRfBu5l4QJnXcAydPRjILic7GFfnllgEJRMyUKf2qYzBDHXlxi0uuzNkhaLj
 quuHXJ95Q9/78bbP8iltwHoSPeA4tgw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-znBztlw4OO68iavAiwnShQ-1; Mon, 26 Jul 2021 15:39:19 -0400
X-MC-Unique: znBztlw4OO68iavAiwnShQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 v6-20020a170902d686b02901019f88b046so9851948ply.21
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 12:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PJx35XuZAWVlSopQDH4mRLA4sjpcCWF4AZmUKVWvW9I=;
 b=diKVaykcMekSh+rEk6yQNXOSjWJ+cvrdaDqld0dXgl2qUDsckD5jJYUlloGd6Q1XqA
 gmHyG2f2h7+DNTncbqAtrow2BwaNMU2dO4nDMeKQ3wM37efhIHyRVSxJ6GepJscgePN1
 YdPfX6Rp4vjmbaCAW4hbk3tbLG61nkDw4qK5mJXvHG0uE7ebkqeEVZOtU6pUPJblSHxx
 OiCImRdD2AbF/nMrOfv8cQhuNLF70T+/CSOjWcfs+1vS8KD1BcQ7dLtmZ4IOnelk1m0Z
 moL2DL6CbHOoFkVPzrY2PF0CIMEspotNdFTI14VXdwfR5hPjtq47MyEOTLRg6TZ3S70H
 6RTQ==
X-Gm-Message-State: AOAM5335FWN/ONOCiK3JL6k40XaeDIw6oQZ5XFfUIlLRbxnyYd2B9NkO
 Y86E29IPUI6KC7sUPg7MdjT3GkJbLCBJRaCx3j9FHdJCWD1GiedET9EVpi3fgHsz7xFa4ea//+3
 u/yYVacqapneuqrwtcCqLwgEf6vAwaCQ=
X-Received: by 2002:a63:fe51:: with SMTP id x17mr19545281pgj.58.1627328358150; 
 Mon, 26 Jul 2021 12:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK8z7yR1B1t5Xjzg03nnEjrKxY9gwi3Dmq3XreE70Dzx9btZa6ZHvUqXo7oTEIVm3CT5ONDCV5rz8NEe1zTqU=
X-Received: by 2002:a63:fe51:: with SMTP id x17mr19545261pgj.58.1627328357936; 
 Mon, 26 Jul 2021 12:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-2-philmd@redhat.com>
In-Reply-To: <20210726150429.1216251-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 26 Jul 2021 16:38:51 -0300
Message-ID: <CAKJDGDZvkFK4Ts6POfrtMmVhrm8qqNjVgDWw58Cn=OVY38bsFA@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v4 1/4] docs: Document GitLab custom CI/CD
 variables
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 12:08 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
> ("gitlab: Run Avocado tests manually (except mainstream CI)"), but
> forgot to document it properly. Do it now.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml    | 19 ++-----------------
>  2 files changed, 42 insertions(+), 17 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


