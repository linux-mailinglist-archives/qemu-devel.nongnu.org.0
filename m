Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C7D7263
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 11:37:17 +0200 (CEST)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKJGV-0005en-Gc
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 05:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKJFf-0005Cr-TC
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKJFd-0005kV-SE
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:36:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKJFd-0005k7-Ma
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:36:21 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3C1565F45
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 09:36:18 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id 7so4599243wrl.2
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 02:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KBQLqLkzFS+rs982qohFgWN2778/ZUbSRf77nwmJfqQ=;
 b=AQnm3tkYv4Y+9ZDlAyhPgfy/fzDqt7Sw8+NAPbg+I1mzdlKyoFpSLPDUsASXdHRjbM
 tk4PsafVzMht8RRd8b+BjAPCTLJB5/l4xABRWdkTR3rlSOpT5Cgmmka5j5uRdUloM674
 sL9su5gUHdv/0zOgUq5bKHlg9icyBLwQ3Vn40ckP0Q6NnkuPGpzRuuyAOUwSdQKhxY1N
 UGW+9c01gs2akRYYZazXBs+hg0B/UQp0DexzsywmMqkzTc1G1Nk2kpe/k6HwpLdqdwmG
 8W3t6DVYko3yZjMA+jer5k9gZAazm+y/uaiEO9bsgeqOMZS+bCZYPLgIFhqDAdgWv8al
 /xtQ==
X-Gm-Message-State: APjAAAW9oexdOaTekDIs0XrNHVEy+10yU6y4bHcUn7AKb06tvqPwdrff
 M20drpu7yR/KDWXhvq0jfhvQRzJCFkmHR7UvOE41koiU0jXD2UbuAEOKgRA/O4O5w4elNF8KBVq
 Wg7vBtXblsLigxwA=
X-Received: by 2002:a5d:43c2:: with SMTP id v2mr24288051wrr.153.1571132177695; 
 Tue, 15 Oct 2019 02:36:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHVrLjTDXDqNH5mjr5BQTi/gWXttIbKyq1iwDk82THOvVgG/WSnxcs//XI2epW7RS3a7NtQQ==
X-Received: by 2002:a5d:43c2:: with SMTP id v2mr24288027wrr.153.1571132177500; 
 Tue, 15 Oct 2019 02:36:17 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id c132sm30492022wme.27.2019.10.15.02.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2019 02:36:16 -0700 (PDT)
Subject: Re: [PULL v2 0/2] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20191015084914.18045-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e699021e-d917-dbc4-9fcd-e3fc888dba89@redhat.com>
Date: Tue, 15 Oct 2019 11:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191015084914.18045-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/19 10:49 AM, Stefan Hajnoczi wrote:
> The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e72d:
> 
>    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-10-08 16:08:35 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/stefanha/qemu.git tags/tracing-pull-request
> 
> for you to fetch changes up to 403e11edbfad5da2e6d5842adc9222f60e76ee43:
> 
>    trace: avoid "is" with a literal Python 3.8 warnings (2019-10-15 09:47:16 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> v2:
>   * Replaced "Launchpad:" tag with "Buglink:" as documented on the SubmitAPatch wiki page [Philippe]

Thanks Stefan for this updated pullreq!

