Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764EA462E76
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:25:01 +0100 (CET)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryRg-0003as-5U
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mryPa-0002t1-1d
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:22:53 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36822 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mryPX-0000fa-LR
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:22:49 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxashK36VhlLUBAA--.3301S3;
 Tue, 30 Nov 2021 16:22:35 +0800 (CST)
Subject: Re: [PATCH v11 11/26] target/loongarch: Add floating point comparison
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-12-git-send-email-gaosong@loongson.cn>
 <c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <58f22862-7fad-d9bb-e712-2d915d944a7f@loongson.cn>
Date: Tue, 30 Nov 2021 16:22:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------B6579E2A26E3788EDF5C6B0E"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxashK36VhlLUBAA--.3301S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DGFW7ury8WFW8Kr13CFg_yoW5Jryxpr
 18Ar17Cry8JF1rJr4jqr1UtryUJr4DJw15Cr1UXFWUJF1UJr1jqr1UXr1j9r1DXr4xAryU
 JF1UtFn8Zrs8XrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.211, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B6579E2A26E3788EDF5C6B0E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/20 下午5:02, Richard Henderson wrote:
>
>> +#define FCMP_LT 0x0001  /* fp0 < fp1 */
>> +#define FCMP_EQ   0x0010  /* fp0 = fp1 */
>> +#define FCMP_UN   0x0100  /* unordered */
>> +#define FCMP_GT   0x1000  /* fp0 > fp1 */
>
> Any reason why these bits are not sequential? 
I think this is consistent with the description in Table 9,  and the 
FCMP_GT is need 0x7.
In  get_fcmp_flags(int cond)  the param 'cond' is table 9  COND >> 1,
table 9
COND          True Condition
0x2              LT
0x4              EQ
0x6              EQ  LT
0x8              UN
0x10            GT LT
...
COND >> 1   Flags
0x1              FCMP_LT                            FCMP_LT    0x1
0x2              FCMP_EQ                           FCMP_EQ    0x2
0x3              FCMP_EQ  |  FCMP_LT
0x4              FCMP_UN                          FCMP_UN   0x4
0x8              FCMP_GT |  FCMP_LT          FCMP_GT    0x7
...
so our definitions :
#define FCMP_LT    0x1  /* fp0 < fp1 */
#define FCMP_EQ   0x2  /* fp0 = fp1 */
#define FCMP_UN   0x4  /* unordered */
#define FCMP_GT   0x7  /* fp0 > fp1 */

get_fcmp_flags:
/* bit0(signaling/quiet) bit1(lt) bit2(eq) bit3(un) bit4(neq) */
static uint32_t get_fcmp_flags(int cond)
{
     uint32_t flags = 0;

     if (cond & 0x1) {
         flags |= FCMP_LT;
     }
     if (cond & 0x2) {
         flags |= FCMP_EQ;
     }
     if (cond & 0x4) {
         flags |= FCMP_UN;
     }
     if (cond & 0x8) {
         flags |= FCMP_GT | FCMP_LT;
     }
     return flags;
}

If not .

We should like:

#define FCMP_LT    0x1  /* fp0 < fp1 */
#define FCMP_EQ   0x2  /* fp0 = fp1 */
#define FCMP_UN   0x3  /* unordered */
#define FCMP_GT   0x4  /* fp0 > fp1 */

static uint32_t get_fcmp_flags(int cond)
{
     uint32_t flags = 0;

     if (cond & 0x1) {
         flags |= FCMP_LT;
     }
     if (cond & 0x2) {
         flags |= FCMP_EQ;
     }
     if (cond & 0x3) {
         flags |= FCMP_UN;
     }
     if (cond & 0x4) {
         flags |= FCMP_GT;
     }
     return flags;
}

Is this right?

Thanks
Song Gao

--------------B6579E2A26E3788EDF5C6B0E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard,<br>
    </p>
    <div class="moz-cite-prefix">On 2021/11/20 下午5:02, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">+#define FCMP_LT  
        0x0001  /* fp0 &lt; fp1 */
        <br>
        +#define FCMP_EQ   0x0010  /* fp0 = fp1 */
        <br>
        +#define FCMP_UN   0x0100  /* unordered */
        <br>
        +#define FCMP_GT   0x1000  /* fp0 &gt; fp1 */
        <br>
      </blockquote>
      <br>
      Any reason why these bits are not sequential?
    </blockquote>
    I think this is consistent with the description in Table 9,  and the
    FCMP_GT is need 0x7.<br>
    In  get_fcmp_flags(int cond)  the param 'cond' is table 9  COND
    &gt;&gt; 1, <span style="color: rgb(57, 115, 0); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span> 
    <br>
    table 9<br>
    COND          True Condition<br>
    0x2              LT<br>
    0x4              EQ<br>
    0x6              EQ  LT<br>
    0x8              UN<br>
    0x10            GT LT<br>
    ...<br>
    COND &gt;&gt; 1   Flags<br>
    0x1              FCMP_LT                            FCMP_LT    0x1 <br>
    0x2              FCMP_EQ                           FCMP_EQ    0x2<br>
    0x3              FCMP_EQ  |  FCMP_LT         <br>
    0x4              FCMP_UN                          FCMP_UN   0x4<br>
    0x8              FCMP_GT |  FCMP_LT          FCMP_GT    0x7<br>
    ...<br>
    so our definitions :<br>
    #define FCMP_LT    0x1  /* fp0 &lt; fp1 */<br>
    #define FCMP_EQ   0x2  /* fp0 = fp1 */<br>
    #define FCMP_UN   0x4  /* unordered */<br>
    #define FCMP_GT   0x7  /* fp0 &gt; fp1 */<br>
    <br>
    get_fcmp_flags:<br>
    /* bit0(signaling/quiet) bit1(lt) bit2(eq) bit3(un) bit4(neq) */<br>
    static uint32_t get_fcmp_flags(int cond)<br>
    {<br>
        uint32_t flags = 0;<br>
    <br>
        if (cond &amp; 0x1) {<br>
            flags |= FCMP_LT;<br>
        }<br>
        if (cond &amp; 0x2) {<br>
            flags |= FCMP_EQ;<br>
        }<br>
        if (cond &amp; 0x4) {<br>
            flags |= FCMP_UN;<br>
        }<br>
        if (cond &amp; 0x8) {<br>
            flags |= FCMP_GT | FCMP_LT;<br>
        }<br>
        return flags;<br>
    }<br>
    <p>If not .<br>
    </p>
    <p>We should like:</p>
    <p>#define FCMP_LT    0x1  /* fp0 &lt; fp1 */<br>
      #define FCMP_EQ   0x2  /* fp0 = fp1 */<br>
      #define FCMP_UN   0x3  /* unordered */<br>
      #define FCMP_GT   0x4  /* fp0 &gt; fp1 */</p>
    <p>static uint32_t get_fcmp_flags(int cond)<br>
      {<br>
          uint32_t flags = 0;<br>
      <br>
          if (cond &amp; 0x1) {<br>
              flags |= FCMP_LT;<br>
          }<br>
          if (cond &amp; 0x2) {<br>
              flags |= FCMP_EQ;<br>
          }<br>
          if (cond &amp; 0x3) {<br>
              flags |= FCMP_UN;<br>
          }<br>
          if (cond &amp; 0x4) {<br>
              flags |= FCMP_GT;<br>
          }<br>
          return flags;<br>
      }</p>
    <p>Is this right?<br>
    </p>
    Thanks<br>
    Song Gao<br>
  </body>
</html>

--------------B6579E2A26E3788EDF5C6B0E--


