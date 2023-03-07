Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E786AD44B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 02:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMW7-0004oi-N9; Mon, 06 Mar 2023 20:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pZMVs-0004oR-1T
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 20:53:12 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pZMVp-0002iZ-KQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 20:53:11 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxJAz8mAZkLCYJAA--.11384S3;
 Tue, 07 Mar 2023 09:53:00 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX+T8mAZkxWlNAA--.35738S3; 
 Tue, 07 Mar 2023 09:53:00 +0800 (CST)
Subject: Re: [PULL 13/23] target/loongarch: Update README
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
 <20220704093357.983255-14-richard.henderson@linaro.org>
 <4b5c9662-c609-8b52-ebd0-cbc461c751f7@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d0ba9ca0-f038-232b-581a-ac92b21871aa@loongson.cn>
Date: Tue, 7 Mar 2023 09:53:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4b5c9662-c609-8b52-ebd0-cbc461c751f7@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------705E75835212141BE0D913B8"
Content-Language: en-US
X-CM-TRANSID: AQAAf8AxX+T8mAZkxWlNAA--.35738S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZrW5Zw4UAFyxGr18uw1DGFg_yoWxKrc_ta
 1fGanY9r4Yqrs3Jr1Iqr9a9rWUXa1FqryIya95tr4FqayxXr9YgFs5W34fAa15tFWjq3ZI
 qan7Xr1xuw10qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYc7kC6x804xWl14x267AKxVWUJVW8
 JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
 kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
 F7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG
 8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aV
 AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8GjcxK6IxK0xII
 j40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjxUzPfHUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

This is a multi-part message in MIME format.
--------------705E75835212141BE0D913B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/3/6 下午10:29, Philippe Mathieu-Daudé 写道:
>> +- Linux-user emulation
>> +
>> +  We already support Linux user emulation. We can use LoongArch 
>> cross-tools to build LoongArch executables on X86 machines,
>> +  and We can also use qemu-loongarch64 to run LoongArch executables.
>> +
>> +  1. Config cross-tools env.
>> +
>> +     see System emulation.
>> +
>> +  2. Test tests/tcg/multiarch.
>> +
>> +     ./configure  --static  --prefix=/usr  --disable-werror 
>> --target-list="loongarch64-linux-user" --enable-debug
>
> Why are we recommending to build this particular target with
> --disable-werror, what is the problem? 
This is copied from our old version code.  We need drop it.

Thanks.
Song Gao

--------------705E75835212141BE0D913B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2023/3/6 下午10:29, Philippe
      Mathieu-Daudé 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4b5c9662-c609-8b52-ebd0-cbc461c751f7@linaro.org">
      <blockquote type="cite" style="color: #000000;">+- Linux-user
        emulation
        <br>
        +
        <br>
        +  We already support Linux user emulation. We can use LoongArch
        cross-tools to build LoongArch executables on X86 machines,
        <br>
        +  and We can also use qemu-loongarch64 to run LoongArch
        executables.
        <br>
        +
        <br>
        +  1. Config cross-tools env.
        <br>
        +
        <br>
        +     see System emulation.
        <br>
        +
        <br>
        +  2. Test tests/tcg/multiarch.
        <br>
        +
        <br>
        +     ./configure  --static  --prefix=/usr  --disable-werror
        --target-list="loongarch64-linux-user" --enable-debug
        <br>
      </blockquote>
      <br>
      Why are we recommending to build this particular target with
      <br>
      --disable-werror, what is the problem?
    </blockquote>
    This is copied from our old version code.  We need drop it.<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------705E75835212141BE0D913B8--


