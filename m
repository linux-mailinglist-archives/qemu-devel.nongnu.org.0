Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826338B8AE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 23:03:43 +0200 (CEST)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljppW-0000gk-D4
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljpks-0005sW-OP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ljpkr-0008Hs-0B
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621544332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PNC5KOiWA3HcwP7+py8+HE0/79kEimnpDhK9/3NaN8Y=;
 b=bvZitK38VjacB37oljscpJg9MEINnQmNVtp5CXrZQw1YHOrXflqWnbGREe89o6knX3ZoF+
 tTw1IGhtobwY/7HaScDViOPEt0v09rGG3bP8nXDu8gTF0BIu9ni0rbcglC6S2HKbh0wG8H
 c5LMQ1cLTNzQqdLuRrDpaslrMQC53l8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-WWVckyypPp6xwc9_VGSZ7Q-1; Thu, 20 May 2021 16:58:50 -0400
X-MC-Unique: WWVckyypPp6xwc9_VGSZ7Q-1
Received: by mail-vs1-f70.google.com with SMTP id
 m21-20020a67e0d50000b029022dcdc1a6ddso5356370vsl.21
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 13:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNC5KOiWA3HcwP7+py8+HE0/79kEimnpDhK9/3NaN8Y=;
 b=P6duBSwHRPqZCw8chsYu6a7ZmYLksz0WysAgs0wM4yjvh4WLGfJxQL9z6SFc0oGakj
 pzYPQ53Dd2oOAgtwPohxaqfZedVhYecphvbvQzdAhHpPTa83kj1IqhtjuTGXpjTjBpCx
 SH3GQuDXQdPdhGMRJBN97hLK04pahtzjUoEVBJIb8RwQho24wfwdXRIVsMGnr/DmYqTO
 gAcMrwBzLZqksn90JA8yNiuXCxnLaD3NYPKGNd/3S7cJyNabPobCY0ERjQY/dX+uXg0f
 3l7dtsR/jUJzeLtIkzjev4eP7eXI7zDO3suBAwc5fUZWiVcC221wPovYjALEZNhcHp35
 kEgA==
X-Gm-Message-State: AOAM530+MKM9nThvHVmYyLez3djJcMXT98HcWPnbBvHMUndTSELwVPke
 opalPjut6uIiNbQQiAceUtcb5DZ+MqkYNLVXdL3ias7pQXN3ZHqFmC+3/mFfcR6Ap5ugYwqRdL7
 rWhsOMs+hFBr9RPr9Lv415gGJHfrtpAk=
X-Received: by 2002:ab0:6848:: with SMTP id a8mr6853765uas.110.1621544330214; 
 Thu, 20 May 2021 13:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/xuDqWqcBrITrbLsPfZsyFw7at/xKIfcWWPzlRYDgmj2h8l607zVSG7l2/08W38E4SfByK6igUfjByTFzB9A=
X-Received: by 2002:ab0:6848:: with SMTP id a8mr6853760uas.110.1621544330043; 
 Thu, 20 May 2021 13:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210520204747.210764-1-willianr@redhat.com>
In-Reply-To: <20210520204747.210764-1-willianr@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 20 May 2021 17:58:24 -0300
Message-ID: <CAKJDGDa5MLM7_hFhAoPp1MDpp7tS7pXOLrbnW+MqWH_Yu3rhXw@mail.gmail.com>
Subject: Re: [RFC 0/1] acceptance tests: bump Avocado version to 88.1
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was not supposed to be an RFC, resending as PATCH.

On Thu, May 20, 2021 at 5:51 PM Willian Rampazzo <willianr@redhat.com> wrote:
>
> CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401
>
> Besides some internal changes, new features, and bug fixes, on the QEMU side,
> this version fixes the following message seen when running the acceptance
> tests: "Error running method "pre_tests" of plugin "fetchasset": 'bytes'
> object has no attribute 'encode'".
>
> The release notes are available at
> https://avocado-framework.readthedocs.io/en/latest/releases/88_0.html.
>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>
> Willian Rampazzo (1):
>   acceptance tests: bump Avocado version to 88.1
>
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.31.1
>
>
>


