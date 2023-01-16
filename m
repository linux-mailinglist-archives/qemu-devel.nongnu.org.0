Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EFC66CD93
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:37:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTQB-00043f-KE; Mon, 16 Jan 2023 12:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTQ2-00041C-R0; Mon, 16 Jan 2023 12:37:14 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTQ1-0005O8-5w; Mon, 16 Jan 2023 12:37:14 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQMm9-1p45Gn1DsH-00MOzV; Mon, 16 Jan 2023 18:37:08 +0100
Message-ID: <bd0503db-f6fb-ffa8-9698-9911e9356f4c@vivier.eu>
Date: Mon, 16 Jan 2023 18:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] tests/qtest/test-hmp: Improve the check for verbose mode
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230109101306.271444-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230109101306.271444-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W8K5KZHD/xRtP6FcHN8f89a7BZBC/jsrOYQ7wmFFcorrK5ksCdz
 o+NOThyfErVBRU8ulld/EYr+EjDQGb6Eqcr6fAjh3bC2Yelw/bxkJ+3Qde5ajgXNjF5wXYP
 UHCEaI1bXGLZ64d3tqHkx60NuzIGPajlfbOk/2XwQxbO+ruLRtQ+gSo+ZLx2CcFRzMWSK9h
 PMcRnzVMrG8qLq2m75fPg==
UI-OutboundReport: notjunk:1;M01:P0:StbGY7NX92M=;VegWylu5OquQYlW7HyOEpgB1tOk
 HBJ8VCzpOqv0TxeAYwbAInA3mUyLN3WC0qY6/pMrv6u7qDDJSpKAhFhrgxu6MEhsu6bVlbMMR
 5z5Q+Ojlp7oKY5zKHAP+rAq/dIvE7MftbicB9zOW8zsrtUSPAExK1lPjI0WlcjQNIOBLPQhRf
 GeHORDRrvIZYS1w8eoeBy0lvPi7+qc7vomixXCLmNUdt1WBAGv2TZzBkhw+nVK6pyWo1Kw2Oo
 xJtf2A94oDGWuLNEc4xI+L0D1fvJBjXpqzIvZp28BGSqj1e4mpQXcHuo9juVaeYzxBajPE9nO
 kbEEegKYUViBFs81JW06eTJKTmjqHLg1eH8epXm5NUdrVOOLnvTAznRgZhAUKJIifN9b8O7WG
 MKLtRo4Cw4ujzSosWkuCrEmbvy9wc4EBq7NjIfoQWGxhngv3BpptZ1ak0gyEOH69Iu0x6M6/X
 P9fEtjoK7yxHLMPERqpP9ONBMvn9ku54WYFnXwVUsEr0Cj55rpIRFV7Hwx7J5OjX+Et+3Xjuc
 jCaDkiWxNQgELeqglNntCp11tpZG9Looq2vyNkuB3j/vkcsN2OBACgfs5cnuPF2W0qYrYB9S1
 fs3OTvYhNT0iIWVdrXTccEjkfcUtjahOTTv56lAWIf3slqdxG0lxDWDLiqNExrwcAxQY19yGW
 PTDDVMl37d0dfu7ohsP0KdwlmtU8i37nfEN4qmYdLA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 09/01/2023 à 11:13, Thomas Huth a écrit :
> Running the test-hmp with V=2 up to V=9 runs the test in verbose mode,
> but running for example with V=10 falls back to non-verbose mode ...
> Improve this oddity by properly treating the argument as a number.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/test-hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index f8b22abe4c..b4a920df89 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -151,7 +151,7 @@ int main(int argc, char **argv)
>   {
>       char *v_env = getenv("V");
>   
> -    if (v_env && *v_env >= '2') {
> +    if (v_env && atoi(v_env) >= 2) {
>           verbose = true;
>       }
>   

Applied to my trivial-patches branch.

Thanks,
Laurent



