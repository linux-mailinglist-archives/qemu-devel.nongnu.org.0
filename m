Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEE4E520F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:18:57 +0100 (CET)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzx2-0000XR-5H
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:18:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWzSz-0002VC-6K; Wed, 23 Mar 2022 07:47:56 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:50870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWzSv-0002AO-SA; Wed, 23 Mar 2022 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=FpmVdokhGrmgo856LC0AbW0nv5CiG1nv1HIl3jmuTVw=; 
 t=1648036069;x=1648641469; 
 b=xLMJMM97q2RJneQnoEkddn4TDjCicdd/h7HP+TmxUZEnmhX84y5GmikeFPv2T9HFVsU96a8IMfppDLU7ZkiWE9XeAaxt2T/7JkiAQrDIEk6b5OETtjKYot1umRj9NA1kO+5hlNGnQJOiXOgcAiWxtujIGNki7KsYqp0AF42TPirkvnV//MyrYHNbOyminjRLn1K0MU3RW+u+GPnmQLlh/qNegt486Ul0o7uRbFY+xww2qR/9Nc5JEMswaZ6VUJT1sICK2tpdW+zR6OKwLc7bcSwGJyYmS8cVmUXowIvrsRrB/17Rwiig1Sp/QyihsC/YkDfhx+YFRZG8nFF1in0HIQ==;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWzSp-0000iD-9z; Wed, 23 Mar 2022 14:47:43 +0300
Message-ID: <81cfdffb-42b9-bb52-7352-f0163eaa744a@mail.ru>
Date: Wed, 23 Mar 2022 14:47:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] iotests.py: Add supports_qcow2_zstd_compression()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220323105522.53660-1-hreitz@redhat.com>
 <20220323105522.53660-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105522.53660-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp55.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA640B06EEE757A11FFF4F198476F253530182A05F5380850404C228DA9ACA6FE271DE3072689FDCDD113CE0AAD4168B68260A11BBF0BDB0B48766D79FF966E1088
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78887611F2F2455C9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B24541F05F0BFC9F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D820888372A76F8ACCD8DD262A0EF55E916F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75EDF10BF501386F09FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF85C6090AC60C6353AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006377714890985855628D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD013041C98CC2AB35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5657BECFC72C51A2BA8F093779647ABB5FBF9F89582BE4324D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA754E2A133C74F7AB4F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F3735C80F9F4B96D9D4A11800DBAED5DF6024F620C17C22443F98FBA5D6B7C1C47A57B9937B0A6FF1D7E09C32AA3244CAA547CDD8CF47A4B671809DB5013FAA7858039643087248083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmC3TJBn2fzQeQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F1524D331D7F6CF44F76F129534BC420076C6D16CAABCAAD7C2E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.35;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp55.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

23.03.2022 13:55, Hanna Reitz wrote:
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index fcec3e51e5..fe10a6cf05 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -1471,6 +1471,26 @@ def verify_working_luks():
>       if not working:
>           notrun(reason)
>   
> +def supports_qcow2_zstd_compression() -> bool:
> +    img_file = f'{test_dir}/qcow2-zstd-test.qcow2'
> +    res = qemu_img('create', '-f', 'qcow2', '-o', 'compression_type=zstd',
> +                   img_file, '0',
> +                   check=False)

check=False may be squashed into previous line

> +    try:
> +        os.remove(img_file)
> +    except OSError:
> +        pass
> +
> +    if res.returncode == 1 and \
> +            "'compression-type' does not accept value 'zstd'" in res.stdout:
> +        return False
> +    else:
> +        return True

May be:

return not(res.returncode == 1 and
    "'compression-type' does not accept value 'zstd'" in res.stdout)

> +
> +def verify_qcow2_zstd_compression():
> +    if not supports_qcow2_zstd_compression():
> +        notrun('zstd compression not supported')
> +
>   def qemu_pipe(*args: str) -> str:
>       """
>       Run qemu with an option to print something and exit (e.g. a help option).

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

-- 
Best regards,
Vladimir

