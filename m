Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373494E53F3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:06:11 +0100 (CET)
Received: from localhost ([::1]:34044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1co-0002HB-A7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:06:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1Ug-0007Ou-K1
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:57:46 -0400
Received: from smtp57.i.mail.ru ([217.69.128.37]:60846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1Ue-0000vK-AF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=mYILpp+9/1IhP2p/6TBRoIyXSvvfosFpFmTq3r/EQxs=; 
 t=1648043864;x=1648649264; 
 b=WUbI1++Wj37tH/iYIF19zTyqAmxIb/dhmNLJTWk/1zGqap6xWU0Vmq44k+svZsnwjN/SiQSzRfZ7OstYPf+vXG+GddigP1RfNE27oIwYzqrqP/6lattGrCWgPL1rdnnRyLOWwXRIMufFDmjDLn7wO//CCFXCnODuDZZ9AIzk9DX929ZmTiB8ssBye2lIk2sRUbA/2xFzQzZgM34y6Z6lgRBGLJNXdhzaOBUElpf9ynFO399ezOktfGAwLORQHySU8a9J3ehEbw4B/Ynfx+B02VuDhPVPIVsnv9v4Bsr3IsnNXWrPr6AUDLOGNm9zr2T+qu3+daEElYNUNUb5jSGFJA==;
Received: by smtp57.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX1Ua-00070L-Ld; Wed, 23 Mar 2022 16:57:41 +0300
Message-ID: <48f06c75-de34-ade1-afa4-bcac105e4520@mail.ru>
Date: Wed, 23 Mar 2022 16:57:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 7/8] migration: analyze-migration script changed
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-8-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-8-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp57.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DAEE08C8B4332C69BD3B54C3E627D4433182A05F53808504028DAE64A1553DFCA17457C3DABDAF8186F4890CE84A41D54E2BC2302D82C3278
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE720512D700D076E85EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375FE8AD9F0D2764EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80D675AB1DFBEF25F45C5584F9DA4F5406F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7820CF4CC0E318EFB9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCC95D571C2F6A10863AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006370DB91CA68F887047D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F6736582285900E6157739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5E18BEA4293A8205DB69DA7F561B6953F5B97F771F5C99D96D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3444047AE358B407548ED8B9916777559BB1D73F8504863DB548EA5390DFC2268A15CBA525F0FE1B771D7E09C32AA3244C10E811A8D9805453B25BF17136F670B7D9ADFF0C0BDB8D1F927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmCJvpKa6o5sqQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F1562815C9195B2670ABFE5041084C3CE5FA73B5475A84BF935E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.37;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp57.i.mail.ru
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

23.03.2022 13:53, Nikita Lapshin wrote:
> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> 
> This script is used for RAM capabilities test. But it cannot work
> in case of no vm description in migration stream.
> So new flag is added to allow work this script with ram-only
> migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   scripts/analyze-migration.py | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
> index b82a1b0c58..80077a09bc 100755
> --- a/scripts/analyze-migration.py
> +++ b/scripts/analyze-migration.py
> @@ -495,7 +495,7 @@ def __init__(self, filename):
>           self.filename = filename
>           self.vmsd_desc = None
>   
> -    def read(self, desc_only = False, dump_memory = False, write_memory = False):
> +    def read(self, ram_only, desc_only = False, dump_memory = False, write_memory = False):
>           # Read in the whole file
>           file = MigrationFile(self.filename)
>   
> @@ -509,7 +509,8 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>           if data != self.QEMU_VM_FILE_VERSION:
>               raise Exception("Invalid version number %d" % data)
>   
> -        self.load_vmsd_json(file)
> +        if not ram_only:
> +            self.load_vmsd_json(file)
>   
>           # Read sections
>           self.sections = collections.OrderedDict()
> @@ -518,7 +519,10 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>               return
>   
>           ramargs = {}
> -        ramargs['page_size'] = self.vmsd_desc['page_size']
> +        if ram_only:
> +            ramargs['page_size'] = 4096
> +        else:
> +            ramargs['page_size'] = self.vmsd_desc['page_size']
>           ramargs['dump_memory'] = dump_memory
>           ramargs['write_memory'] = write_memory
>           self.section_classes[('ram',0)][1] = ramargs
> @@ -579,6 +583,7 @@ def default(self, o):
>   parser.add_argument("-m", "--memory", help='dump RAM contents as well', action='store_true')
>   parser.add_argument("-d", "--dump", help='what to dump ("state" or "desc")', default='state')
>   parser.add_argument("-x", "--extract", help='extract contents into individual files', action='store_true')
> +parser.add_argument("--ram-only", help='parse migration dump containing only RAM', action='store_true')
>   args = parser.parse_args()
>   
>   jsonenc = JSONEncoder(indent=4, separators=(',', ': '))
> @@ -586,14 +591,14 @@ def default(self, o):
>   if args.extract:
>       dump = MigrationDump(args.file)

could this ram_only instead be stored into object, so that we do

dump = MigrationDump(args.file, ram_only=args.ram_only)

and don't update each read call?

>   
> -    dump.read(desc_only = True)
> +    dump.read(desc_only = True, ram_only = args.ram_only)
>       print("desc.json")
>       f = open("desc.json", "w")
>       f.truncate()
>       f.write(jsonenc.encode(dump.vmsd_desc))
>       f.close()
>   
> -    dump.read(write_memory = True)
> +    dump.read(write_memory = True, ram_only = args.ram_only)
>       dict = dump.getDict()
>       print("state.json")
>       f = open("state.json", "w")
> @@ -602,12 +607,12 @@ def default(self, o):
>       f.close()
>   elif args.dump == "state":
>       dump = MigrationDump(args.file)
> -    dump.read(dump_memory = args.memory)
> +    dump.read(dump_memory = args.memory, ram_only = args.ram_only)
>       dict = dump.getDict()
>       print(jsonenc.encode(dict))
>   elif args.dump == "desc":
>       dump = MigrationDump(args.file)
> -    dump.read(desc_only = True)
> +    dump.read(desc_only = True, ram_only = args.ram_only)
>       print(jsonenc.encode(dump.vmsd_desc))
>   else:
>       raise Exception("Please specify either -x, -d state or -d desc")


-- 
Best regards,
Vladimir

