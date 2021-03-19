Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4E341F38
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:20:31 +0100 (CET)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFzL-0002rp-0E
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFyK-0002Pe-QV
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFyH-00015G-Ek
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616163563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8H0c+F61SEyapz8q5/c6cy/S8Gn8xQpKdpW7ClZ7bQ=;
 b=b4URN5CYFh3/4jxjezGwYKvYySc73OZRUrYF/7YTfy9j1sle1Uy/Wc2GHI2/tg4g5jTcPH
 LsY8tLm+U6Yays7uNE5NFYhLp2bwEygSXm7FRN+Ia1gngXek+EQAujVWQMHSW9AIJaUllk
 USoPectVqJ67cYT8F/aBJ4qQL6i0F4c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-xjOV0cBmMMGkStx0Qy3v0Q-1; Fri, 19 Mar 2021 10:19:21 -0400
X-MC-Unique: xjOV0cBmMMGkStx0Qy3v0Q-1
Received: by mail-wm1-f70.google.com with SMTP id r18so12945697wmq.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8H0c+F61SEyapz8q5/c6cy/S8Gn8xQpKdpW7ClZ7bQ=;
 b=cDd7aRbIQH4HiHi9Ot+Dk6c1/NgzT/dtSeD1WKbghOk/fV7/v64+JC5um+K7fCLgQX
 Oiqi+gqopwQliVjwUbjJqqRF+HmGs4shkaSDtczbkisxo2um5B839OURjR9tKu4761QA
 L9UmffLSuGdu3TQZ+N0e6irtSwX2LaHQE9LKFvhiditau5Xk9H4hBVgdrpMot6sXJ0P8
 fpLem3uUdIssoW/kKl0JV9PRS48bR4r8xnyv3YLBelscaaJ1IYrY+cqorVo2a8yohevS
 qW9FtG2yp6ZgUbDbZY8gAH6MisShxIlu39hf+yfz5dNGLUgyGTAlHyDVMbl7s5r0ydR0
 IWtw==
X-Gm-Message-State: AOAM533je90SWmH/87WAyMwERC95RKccdqL/BJYlWh2v5WI09RGOiYTi
 8dkjzrnEDp1CE0KXZq6wlcKS5FO4aDnOMf+FqEqdVpF5mR5UMi6KcRxTOZwwbDc9DWdUeesLuym
 cfkKi5WU3WqwwUBvyEw3j5yPhA+HX5muroNCTlOqawCbdcj92z3QfpzeS3w8yLUww
X-Received: by 2002:a5d:684d:: with SMTP id o13mr4994689wrw.235.1616163560365; 
 Fri, 19 Mar 2021 07:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcqe6Gmg/2DJuTcpO9ufoZWhzNvESjwPtj7qBNm0aOhbjDQaE7mQK60Wj5h0gC9Zqb4UmRqg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr4994666wrw.235.1616163560165; 
 Fri, 19 Mar 2021 07:19:20 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i8sm8138709wrx.43.2021.03.19.07.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 07:19:19 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest: cleanup the testcase for bug 1878642
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210319085644.2082315-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46788dcb-d195-2bae-ed3f-8e895bc7e008@redhat.com>
Date: Fri, 19 Mar 2021 15:19:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319085644.2082315-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 9:56 AM, Paolo Bonzini wrote:
> Clean up the writes to the configuration space and the PM region, and
> rename the test to lpc-ich9-test.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/qtest/{fuzz-test.c => lpc-ich9-test.c} | 12 +++++++-----
>  tests/qtest/meson.build                      |  2 +-
>  2 files changed, 8 insertions(+), 6 deletions(-)
>  rename tests/qtest/{fuzz-test.c => lpc-ich9-test.c} (71%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


