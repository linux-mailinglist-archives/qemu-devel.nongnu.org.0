Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF15F3206
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMZ2-0004Jn-FH
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMNl-00042f-2r
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:25:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMNi-0008Kw-I0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 10:25:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b7so9387393wrq.9
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ckh4LpF/A1SpuWt25MOlLv5GtschqWHTfmzSCL57Y3w=;
 b=GWURA5kltpAmHrd/8A8HPmNW91b0eHcB3AIPCpcrwrf8MWAbdvzgYJYvgCifQhAa9F
 coclkph4MTdckrZrwMTOeVGk5nrFyKkA8w9XZWFRF6wUUCLG4dVyUct0VixroDldTqPJ
 KRuKBbMaYZ5ka/S6TREC+BtoWEbBJBJAiP7LADVq9vbos/6fRkBrw4lCIvtlzaKhS3N3
 Civ6xtbeIDdWbNI87Z5EsEukbgPczxlNGN7MJfXcCL8NasVC7WKBM5crIyeou/4Hastc
 1loJAPyx0uHyLPVpQhAhycjL4Hj7GsInIn8i5EEeDk22CCfEPan9/t44W3bOHc8aHm0f
 pZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ckh4LpF/A1SpuWt25MOlLv5GtschqWHTfmzSCL57Y3w=;
 b=KnMTR+bg9MUMXRoZIQ347guezwqVYDmISc6BBSlKLkTCSqF9ftknQnQrNSWhBcnQSU
 B7FaCJFn9D/S3T4KumDcaaz3GNW7+bYolXUzglN2HwoZWPBRexvBQhAy0u+VkcYOLR5m
 9JAidf+lOE6VfvthMwpDc9CE3rdetlD8gwoMuifS5zSStdxr5zBlgIMb3JmhVAULW7fQ
 J3yAjOk9rT+6otgaT09TS0xa86tjZHaBInQJza5Jydv/6Dk1QJCttqohgUGUkNZS2cC9
 6zAcjtKlpT/sigcX8XhZHDpGNOaXrbNW+UUatXAVZq8ES8zho8WVdHNBzJ1yF7OG0jZE
 v2sw==
X-Gm-Message-State: ACrzQf3lpMN7wUWcAOb5+/xGNiugTLuCsZ3uBl4LH5YKmXCF+R/V88RJ
 KYZmqEuDEB9D6kFV1U//DzE=
X-Google-Smtp-Source: AMsMyM4/lhMorkCMutsYpOWf1O53XPTJ9bLCJmDnhA9RRjJ7Ai+PbiXCDnuhbpo87xlJq5I1vj3amw==
X-Received: by 2002:a5d:5a16:0:b0:22c:a07c:649e with SMTP id
 bq22-20020a5d5a16000000b0022ca07c649emr12467648wrb.107.1664807116407; 
 Mon, 03 Oct 2022 07:25:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r15-20020adfe68f000000b00228daaa84aesm9927127wrm.25.2022.10.03.07.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:25:15 -0700 (PDT)
Message-ID: <663a81da-8901-0bb8-826e-e2201077e10c@amsat.org>
Date: Mon, 3 Oct 2022 16:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
 A_CVI_NEW
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com
References: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
In-Reply-To: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/9/22 22:08, Matheus Tavares Bernardino wrote:
> Hexagon instructions with the A_CVI_NEW attribute produce a vector value
> that can be used in the same packet. The python function responsible for
> generating code for such instructions has a typo ("if" instead of
> "elif"), which makes genptr_dst_write_ext() be executed twice, thus also
> generating the same tcg code twice. Fortunately, this doesn't cause any
> problems for correctness, but it is less efficient than it could be. Fix
> it by using an "elif" and avoiding the unnecessary extra code gen.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/gen_tcg_funcs.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


