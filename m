Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26E5AB62D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:08:14 +0200 (CEST)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9DJ-0005im-3v
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oU95K-0007nm-CV
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:59:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oU95H-0000fj-Nx
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:59:56 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 h13-20020a17090a648d00b001fdb9003787so2522394pjj.4
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=VvCI+kGxhBNK7aOhLDDVk5Z7vlnsvsKtELD1SoaeQWk=;
 b=K6qCRy1kmRByunv9FTAO9ToqYWHX1R6QvIrSNVnVexaWgX5O6zmebn1iPi3GlFrNDL
 ltY35KmVBE5263G70deOY2fpkB/Mo/ml/bp/S2oGlLxzKRW6JuUE3977OYYfTVGgZkED
 mM8cUelEnwcNfm943vbkFiH9RL8y+jJ5J2iAob6aAlvtt725FsNVkieTxQgKaB/TKi/t
 R1VIUP2u7la7o18+sYxziAfYVaILT3dICaFU5Anp9o62GBWriUdoHo3+nBEXbnZ/6IiG
 j1tqo3bVFar0xqL0bUkuh7RjH3x7cHH6I6vvPyVnDruZqqytBz4eTYSZng+yV3S+LkQn
 WYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=VvCI+kGxhBNK7aOhLDDVk5Z7vlnsvsKtELD1SoaeQWk=;
 b=McwNacdpXraN6f6i1nebpIqTDEb1lRwgLiwR7UkCFTLKxAP+jInAk75PO6FlOl2Nl0
 aJKk1IS1LwBLE2r75Y5XDWmWZ3VxiO33LysIzrFhMXddEzKHRtOaHVPHs3/ll5dL5tHL
 pIgaATrgH8zyDgE4pS5TECaMd/GO1TzL1pGYo9Kw//UZan2sg0icRB3pCkbDL92Ku1kt
 6bPwzMoiHJoTG4zpgCpY2PUhAIhvTxUfvOJXHh1Ey4Vz6AlvxhWJblQsWtoXOZGcwx40
 BbemX2/6H8UnZj4FdUorZ0T413pfF7OqI+qWyUKRDdn2wfvrR7B6EpRkdcIxE90O/7YK
 nWZg==
X-Gm-Message-State: ACgBeo3ixF+BFbKyin77nTEfNoU6uu8qBEduUnT/qM0JzzhNed42aV+x
 y9jXC5BF5tZ0+joTMLfPx2A=
X-Google-Smtp-Source: AA6agR7M/N7wYo/XypS629y5QMe9BVJBN6O+a/ZtuPWxUClfnfps1ey75K0hSwPSlDXdHPs7LGobew==
X-Received: by 2002:a17:90b:1bc2:b0:1fe:1ad3:4a81 with SMTP id
 oa2-20020a17090b1bc200b001fe1ad34a81mr5409606pjb.61.1662134394266; 
 Fri, 02 Sep 2022 08:59:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090aad8d00b001fdcfe9a731sm1625438pjq.50.2022.09.02.08.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 08:59:53 -0700 (PDT)
Message-ID: <501033a0-a09a-e5fa-a1f9-b29587e2a32a@amsat.org>
Date: Fri, 2 Sep 2022 17:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] qtest/fuzz-lsi53c895a-test: set guest RAM to 2G
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, bmeng.cn@gmail.com, alxndr@bu.edu,
 Thomas Huth <thuth@redhat.com>
References: <20220902133853.834065-1-mcascell@redhat.com>
In-Reply-To: <20220902133853.834065-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 15:38, Mauro Matteo Cascella wrote:
> test_lsi_do_msgout_cancel_req does not run on machines with small size
> memory. Reduce guest memory from 4G to 2G to alleviate the problem.
> 
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

