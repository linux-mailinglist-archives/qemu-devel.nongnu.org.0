Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830941DC48
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:29:58 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVx4O-0008Px-IV
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVx2O-0006iv-Kk
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:27:52 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVx2M-0000yO-3S
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:27:51 -0400
Received: by mail-qk1-x72f.google.com with SMTP id c7so5974981qka.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yYlCOKz9ZKwCxc2U4Dr1LB2ER/zGEmkb3pH7tITF1so=;
 b=ZEkmSDlWy0w9NxYowHi3t6xLcAlkYh6mRtl4yTcksZ+yg/PBCsTy7ew0uusyuQCtVV
 zXLAG3VDIK4S85IJrgC7djK5XU20PKQU6fDRr+lXaFmRzBXoovEDgxzel8C/o0tDY6DZ
 bf/7ildYaZqcGwB7/sknOGE3lzT1DxE4HgHXNDDlev/nJxpGa9x/QlX6d0zwtEYqtfQU
 jgoekaLZPwpPhbQ8J/ramNe6SO3pLU5YaXjin5cTiEITd5/98n0MBdZNoNowwIwQFSWg
 mfMgcVDhBdWhJ+XQjMAL0yG7VzdOxzJNlH7VZehRirIuqAFbGLTIakTf0HLbJxjKsncV
 7I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yYlCOKz9ZKwCxc2U4Dr1LB2ER/zGEmkb3pH7tITF1so=;
 b=y+KWI/o8bC3ibdqEHOTv0Jg4E04Gc0ItcO8TNbogcG265GuTSvbG0IOwOYOMiThzjA
 26FHkVuW1Kn42aiJBT626N9rSIPeNvNRSE4kkU9lr7Ehpq9BbT+MUcAScmNxLrkIw+DA
 oPTnpK7d0FZz6jieEsi32/A5uuX+a5IGk5tw+vt0Qsm4kA8LOuPOkgR2dP+DvQdc/fo0
 T8uovpG4HlvgMbc0FV0qKA2nWMKGnEOUxVUmoN7UW3HQXk4ivqU1MDQVtbY6Y/e1xKKr
 /x7FJEU9NAAwaK5LDNvGuB+jSi8vT+S2uIf1II/wEJosWP4/cMuwxIt2o9HG6lpznELs
 ZBCA==
X-Gm-Message-State: AOAM532nTbR7OzStmZaZLvdvxjrEcWypppcqNHoW8iqZ+okDYThRcwbA
 1QjSmuLBxhUrYPDsZMpDzVic8A==
X-Google-Smtp-Source: ABdhPJziyZ1TqYgbZlhGrERfZ85emrcik8B727gR2mjYgodMdVlsJRKGlIZFJAFjojnDNcRiou8lKA==
X-Received: by 2002:a37:8044:: with SMTP id b65mr5030677qkd.295.1633012068078; 
 Thu, 30 Sep 2021 07:27:48 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l1sm1696017qti.94.2021.09.30.07.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 07:27:47 -0700 (PDT)
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
To: "Richard W.M. Jones" <rjones@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
 <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
 <9ba3ebe2-4d74-628f-fb76-5541f629ff9e@redhat.com>
 <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
 <20210930084506.GV3361@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3c0c8a7-1528-df30-5b6d-e77ce1861180@linaro.org>
Date: Thu, 30 Sep 2021 10:27:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930084506.GV3361@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 4:45 AM, Richard W.M. Jones wrote:
>    PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig ../configure --extra-cflags=-m32 --disable-vhost-user

Not --extra-cflags, use --cpu=i386.


r~

