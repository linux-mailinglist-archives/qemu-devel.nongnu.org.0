Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E9653576
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:43:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8372-0007ej-T7; Wed, 21 Dec 2022 12:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p8370-0007Zx-Nc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:42:38 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p836y-0000iJ-JK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:42:38 -0500
Received: by mail-pj1-x102e.google.com with SMTP id fy4so16503352pjb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ir4MdZwsORS8uTDL/3+3BPul+Ro63HdRdCXQ0RcnO+8=;
 b=AcRXwBcY/YRrpsLvTx2R8A2mlwK2nzBfvaJzXt58LAgbgONd072t5TyBKjp5XvYu4G
 K+CixXHXHUjj8wiIA8hBHS78PYfDX09VUP4eyUinIohtzFcaZe/r65jVp3/ZQkMuUt0c
 fe2ToreJObbuh704fRoxMUT88r5A2fRGFZm0B2vPCDeLhfPiLNxsjs9jStmyXXP+hOj5
 JYNdiiiM+PTEyJpVms7+P1RRwUu/y0Do2qZB63Xa3iclQTwxPjQkllmRSN+pBL6I9fk+
 6CKpPsENiW6YDmCp1CPaUl+DOeclfGgnGu31juUZowyA+uDmqD5PMs89gnb8Bu/yrk9z
 PFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ir4MdZwsORS8uTDL/3+3BPul+Ro63HdRdCXQ0RcnO+8=;
 b=hfwuw4vcFzWULP3YgKSvK9wJ5aHImA2het2DszTcJEB3F3PiogmAS9/5LczvLEaZT1
 7Ntq5mj8RCl48PSQyUmFbeCsHvkZyt/cUjd8T5v3Wwr3EoYE4f3QATFJl/ECNJ9a+1l1
 Aw7Rxp3fTZCOU/z5dKACHUzVcw5ARGLmsPyQCSgpacd0YB+j3Xls2kCLjOz8ZV8mTqvq
 O+fBc8zKODHleXTOv+sKd9CxJPl1eJeDuakbhf2QBwRdSHkL/xaXyvnvYnlA8hrB1E6b
 Ang9XxmSOstUnhPOhF3eFsr9zO9Y3Mz/nrQsN1qyOEW80orR4N0ELYgaOn+UjvBuMmd5
 MIPA==
X-Gm-Message-State: AFqh2krTQUn8xutTwIEU+KSFlglmmb7zVp8e8msh6wQNlN9p7/3xD38w
 mAFpBtn92Tf/HfBxAQ5fm6hbmA==
X-Google-Smtp-Source: AMrXdXsM5Wpj2NE6556s3KhOituqEuiAazcUq8gttphvZBBCOLPw+GSmFqQJJmxmp5AZTpU58VZ2wA==
X-Received: by 2002:a05:6a20:548e:b0:ac:19cf:1553 with SMTP id
 i14-20020a056a20548e00b000ac19cf1553mr4067646pzk.61.1671644555084; 
 Wed, 21 Dec 2022 09:42:35 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:e04c:516d:5698:abe8?
 ([2602:47:d48c:8101:e04c:516d:5698:abe8])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a655789000000b00478ca052819sm10117745pgr.47.2022.12.21.09.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:42:34 -0800 (PST)
Message-ID: <57992d46-9dae-a7e8-9290-64a70343f92d@linaro.org>
Date: Wed, 21 Dec 2022 09:42:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/hexagon: suppress unused variable warning
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, Alessandro Di Federico
 <ale@rev.ng>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>
References: <20221221100254.1352686-1-ale@rev.ng>
 <SN4PR0201MB880819591F8CC1584B462814DEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB880819591F8CC1584B462814DEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/21/22 07:43, Taylor Simpson wrote:
>> --- a/target/hexagon/idef-parser/idef-parser.y
>> +++ b/target/hexagon/idef-parser/idef-parser.y
>> @@ -99,6 +99,8 @@
>>   /* Input file containing the description of each hexagon instruction */  input :
>> instructions
>>         {
>> +          // Suppress warning about unused yynerrs
>> +          (void) yynerrs;
>>             YYACCEPT;
>>         }
>>         ;
> 
> According to this page
> https://qemu-project.gitlab.io/qemu/devel/style.html#comment-style
> we should avoid // comments, and the checkpatch script will warn about this.  However, checkpatch does not warn on this patch.

It does not process *.y.


r~

